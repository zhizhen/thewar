#!/usr/bin/env python
# encoding: utf-8
import sys
import re
import copy

class ProtoParse:
    def __init__(self):
        self.messages = {}

    def parse(self, contentAll):
        matches = re.findall("message[\s]+[\w]+[ \t\n]*{[ \n]+[^}]*}", contentAll)

        if len(matches) <= 0:
            return

        for item in matches:
            message = self._parse_message(item)
            self.messages[message.getName()] = message

        return self.messages

    def _parse_message(self, messageDesc):

        messageName = messageDesc[8:messageDesc.find("{")]
        messageBody = messageDesc[messageDesc.find("{")+1:messageDesc.find("}")]
        _fields = messageBody.split("\n")
        fields = []
        for item in _fields:
            if item == "":
                continue
            fields.append(item.strip())

        pm = ProtoMessage(messageName.strip())

        for field in fields:
            info = re.findall("[ \t]*(required|optional|repeated)[ \t]+(\w+)[ \t]+(\w+)[ \t]*(\[default[ \t]*=[ \t]*([^\[\]]+)\])?;", field)
            if not info:
                continue
            info = info[0]
            fieldObj = ProtoField()
            fieldObj.type = info[0].strip()
            fieldObj.dataType = info[1].strip()
            fieldObj.name = info[2].strip()
            fieldObj.default = info[4].strip() if info[4] != '' else None
            pm.push(fieldObj)

        return pm

class ProtoMessage:

    def __init__(self, name):
        self.fields = []
        self.name = name

    def getName(self):
        return self.name

    def setName(self, name):
        self.name = name

    def push(self, field):
        self.fields.append(field)

    def getFields(self):
        return self.fields


class ProtoField:

    def __init__(self):
        self.type = None
        self.dataType = None
        self.name = None
        self.default = None


class ProtoNifGenerator:

    def __init__(self):
        self.allMessage = {}
        self.erlangEncodes = {}
        self.erlangDecodes = {}
        self.erlangCode = ''
        self.erlEncodeFuncArray = {}
        self.erlEncodeRepeatedFuncArray = {}
        self.erlDecodeRepeatedFuncArray = {}
        self.erlDecodeFuncArray = {}

        self.inTypes = ['byte', 'ubyte', 'short', 'ushort', 'int32', 'uint32', 'int64', 
        'uint64', 'double', 'float', 'string', 'bytes']

    def geneLua(self, string, path):
        pb = ProtoParse()
        self.allMessage = pb.parse(string)

        map_proto = 'module(..., package.seeall)\n\n'
        route_proto = 'ProtocolController = class()\n\n'
        requieds = "local Protocol = required \"NetWork/Protocol\"\n"
        map_route = ""
        proto_defines = "module(..., package.seeall)\n\n"
        p_defines = ""
        m_defines = ""

        for name, message in self.allMessage.iteritems():
            types = name.split("__")
            fields = message.getFields()
            if len(types) == 4:
                #协议
                msg_id = fields[0].default
                module = types[1]
                func = types[2]
                cs = types[3]

                if cs == "c2s":
                    map_proto += "%s_%s = %s\n" % (module, func, msg_id)

                vModule = module.capitalize()
                requieds += "local %s = required \"Proto/%s\"\n" % (vModule, vModule)
                map_route += "        [%s] = {%s.%s_%s, Protocol.%s},\n" % (msg_id, vModule, func, cs, name)
                m_defines += "%s = {\n" % name
                keys = []
                for field in fields[1:]:
                    optiontype = field.type
                    fieldtype = field.dataType
                    if optiontype == "required" or optiontype == "optional":
                        if fieldtype in ['byte', 'ubyte', 'short', 'ushort', 
                        'int32', 'uint32', 'int64', 'uint64']:
                            defaultvalue = 0
                            fieldTypeConvert = "\"%s\"" % fieldtype
                        elif fieldtype == 'string':
                            defaultvalue = "\"\""
                            fieldTypeConvert = "\"%s\"" % fieldtype
                        elif fieldtype not in self.inTypes and fieldtype.split("_")[0] == "p":
                            defaultvalue = "clone(%s)" % fieldtype
                            fieldTypeConvert = "\"Struct\""
                        else:
                            defaultvalue = "nil"
                        m_defines += "    %s = %s,\n" % (field.name, defaultvalue)
                    else:
                        #repeated
                        defaultvalue = {}
                        m_defines += "    %s = %s,\n" % (field.name, defaultvalue)
                        if fieldtype not in self.inTypes and fieldtype.split("_")[0] == "p":
                            fieldTypeConvert = fieldtype
                        else:
                            fieldTypeConvert = "\"%sList\"" % fieldtype
                    keys.append("{\"%s\", %s}" % (field.name, fieldTypeConvert))
                m_defines += "    _keys = {%s}\n" % ",\n             ".join(keys)
                m_defines += "}\n\n"
            else:
                #结构体
                p_defines += "%s = {\n" % name
                keys = []
                for field in fields:
                    optiontype = field.type
                    fieldtype = field.dataType
                    if optiontype == "required" or optiontype == "optional":
                        if fieldtype in ['byte', 'ubyte', 'short', 'ushort', 
                        'int32', 'uint32', 'int64', 'uint64']:
                            defaultvalue = 0
                            fieldTypeConvert = "\"%s\"" % fieldtype
                        elif fieldtype == 'string':
                            defaultvalue = "\"\""
                            fieldTypeConvert = "\"%s\"" % fieldtype
                        elif fieldtype not in self.inTypes and fieldtype.split("_")[0] == "p":
                            defaultvalue = "clone(%s)" % fieldtype
                            fieldTypeConvert = "\"Struct\""
                        else:
                            defaultvalue = "nil"
                        p_defines += "    %s = %s,\n" % (field.name, defaultvalue)
                    else:
                        defaultvalue = {}
                        p_defines += "    %s = %s,\n" % (field.name, defaultvalue)

                        if fieldtype not in self.inTypes and fieldtype.split("_")[0] == "p":
                            fieldTypeConvert = fieldtype
                        else:
                            fieldTypeConvert = "\"%sList\"" % fieldtype
                    keys.append("{\"%s\", %s}" % (field.name, fieldTypeConvert))
                p_defines += "    _name = \"%s\",\n" % name
                p_defines += "    _keys = {%s}\n" % ",\n             ".join(keys)
                p_defines += "}\n\n"


        #
        f = open(path + "/ProtocolController.lua", 'w')
        f.write(map_proto)
        f.close()

        #
        route_proto += requieds
        route_proto += "\n"
        route_proto += "function ProtocolController:ctor(gameManager)\n"
        route_proto += "    self.gameManager = gameManager\n"
        route_proto += "    self.action = {\n"
        route_proto += map_route
        route_proto += "    }\n"
        route_proto += "end\n\n"
        route_proto += "function ProtocolController:getFunction(funcId)\n"
        route_proto += "    return self.action[funcId]\n"
        route_proto += "end\n"
        f = open(path + "/ProtocolIdMap.lua", 'w')
        f.write(route_proto)
        f.close()

        proto_defines += p_defines
        proto_defines += "\n"
        proto_defines += m_defines
        f = open(path + "/Protocol.lua", 'w')
        f.write(proto_defines)
        f.close()



def build_proto(proto_path, lua_path):
    f = open(proto_path)
    data = f.read()
    f.close()
    data = re.sub("\/\/.*\n", "\n", data)

    generator = ProtoNifGenerator()
    generator.geneLua(data, lua_path)

proto_path = sys.argv[1]
lua_path = sys.argv[2]

build_proto(proto_path, lua_path)
print 'ok'