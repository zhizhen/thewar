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

    def trim(self, Str, value):
        return Str[:-1] if Str[-1] == value else Str

    def _gene_erlang_encode_export(self):
        code = '-export(['
        for funcName in self.erlangEncodes:
            code += "\n    %s/%s," % (funcName, self.erlangEncodes[funcName])

        code = self.trim(code, ",")
        code += "\n]).\n\n"
        return code

    def _gene_erlang_decode_export(self):
        code = '-export(['
        for funcName in self.erlangDecodes:
            code += "\n    %s/%s," % (funcName, self.erlangDecodes[funcName])

        code = self.trim(code, ",")
        code += "\n]).\n\n"
        return code


    def geneErlang(self, string):
        pb = ProtoParse()
        self.allMessage = pb.parse(string)

        for name, message in self.allMessage.iteritems():
            self.erlangCode += self._gene_erlang_code(message)

        while self.erlEncodeFuncArray or self.erlDecodeFuncArray:
            erlEncodeFuncArray = copy.deepcopy(self.erlEncodeFuncArray)
            self.erlEncodeFuncArray = {}
            for k, v in erlEncodeFuncArray.iteritems():
                if k in self.inTypes:
                    continue
                m = self.allMessage[k]
                self.erlangCode += self._gene_erlang_encode_code(m)


            erlDecodeFuncArray = copy.deepcopy(self.erlDecodeFuncArray)
            self.erlDecodeFuncArray = {}
            for k, v in erlDecodeFuncArray.iteritems():
                if k in self.inTypes:
                    continue
                m = self.allMessage[k]
                self.erlangCode += self._gene_erlang_decode_code(m)



        while self.erlEncodeRepeatedFuncArray or self.erlDecodeRepeatedFuncArray:
            erlEncodeRepeatedFuncArray = self.erlEncodeRepeatedFuncArray
            self.erlEncodeRepeatedFuncArray = {}
            for k, v in erlEncodeRepeatedFuncArray.iteritems():
                if k in self.inTypes:
                    continue
                m = self.allMessage[k]
                self.erlangCode += self._gene_erlang_encode_repeated_code(m)


            erlDecodeRepeatedFuncArray = self.erlDecodeRepeatedFuncArray
            self.erlDecodeRepeatedFuncArray = {}
            for k, v in erlDecodeRepeatedFuncArray.iteritems():
                if k in self.inTypes:
                    continue
                m = self.allMessage[k]
                self.erlangCode += self._gene_erlang_decode_repeated_code(m)


        code = "-module(game_pb).\n"
        code += "-include(\"game_pb.hrl\").\n"

        code += self._gene_erlang_encode_export() + self._gene_erlang_decode_export()

        code += "\n"
        code += "-export([\n"
        code += "    encode/1,\n"
        code += "    decode/1\n"
        code += "]).\n\n"

        code += "-export([\n"
        code += "    encode_bytes/2,\n"
        code += "    encode_ubytes/2,\n"
        code += "    encode_shorts/2,\n"
        code += "    encode_ushorts/2,\n"
        code += "    encode_int32s/2,\n"
        code += "    encode_uint32s/2,\n"
        code += "    encode_int64s/2, \n"
        code += "    encode_doubles/2,\n"
        code += "    encode_bools/2,\n"
        code += "    encode_strings/2\n"
        code += "]).\n\n"

        code += "-export([\n"
        code += "    decode_bytes/2,\n"
        code += "    decode_ubytes/2,\n"
        code += "    decode_shorts/2,\n"
        code += "    decode_ushorts/2,\n"
        code += "    decode_int32s/2,\n"
        code += "    decode_uint32s/2,\n"
        code += "    decode_int64s/2, \n"
        code += "    decode_doubles/2,\n"
        code += "    decode_bools/2,\n"
        code += "    decode_strings/2\n"
        code += "]).\n\n"

        code += self._gene_interface_code()
        code += self._gene_intype_encode_repeated_code()
        code += self._gene_intype_decode_repeated_code()


        hrlCode = self._gene_erlang_hrl()
        erlCode = code + self.erlangCode

        return hrlCode, erlCode


    def _gene_erlang_hrl(self):
        code = ''
        code += "-ifndef(GAME_PB_HRL).\n"
        code += "-define(GAME_PB_HRL, true).\n"
        for name, message in self.allMessage.iteritems():
            recordName = message.getName()
            fields = message.getFields()
            rCode = "-record(%s, {" % recordName
            for field in fields:
                default = field.default
                if default is not None:
                    rCode += "%s=%s," % (field.name, default)
                else:
                    rCode += "%s," % field.name

            code +=  self.trim(rCode, ",") + "}).\n"

        code += "-endif."
        return code

    def _gene_interface_code(self):
        code = ''
        code += "encode(RecordData) ->\n"
        code += "    MsgId = element(2, RecordData),\n"
        code += "    FuncName = string:concat(\"encode_\", integer_to_list(MsgId)),\n"
        code += "    Bin = apply('game_pb', list_to_atom(FuncName), [RecordData]),\n"
        code += "    {ok, Bin}.\n"
        code += "\n"
        code += "decode(BinData) ->\n"
        code += "    <<MsgId:32, _/binary>> = BinData,\n"
        code += "    FuncName = string:concat(\"decode_\", integer_to_list(MsgId)),\n"
        code += "    Record = apply('game_pb', list_to_atom(FuncName), [BinData]),\n"
        # code += "    RecordName = element(1, Record),\n"
        # code += "    [_, M, F, _] = re:split(atom_to_list(RecordName), \"__\", [{return, list}]),\n"
        # code += "    {ok, {list_to_atom(M ++ \"_api\"), list_to_atom(F), Record}}.\n"
        code += "    {ok, Record}.\n"
        return code
    

    def _gene_intype_encode_repeated_code(self):
        code = ''
        code += "encode_bytes([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_bytes([H|T], Bin) ->\n"
        code += "    encode_bytes(T, <<Bin/binary, H:8/signed>>).\n"

        code += "encode_ubytes([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_ubytes([H|T], Bin) ->\n"
        code += "    encode_bytes(T, <<Bin/binary, H:8/unsigned>>).\n"

        code += "encode_shorts([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_shorts([H|T], Bin) ->\n"
        code += "    encode_shorts(T, <<Bin/binary, H:16/signed>>).\n"

        code += "encode_ushorts([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_ushorts([H|T], Bin) ->\n"
        code += "    encode_ushorts(T, <<Bin/binary, H:16/unsigned>>).\n"

        code += "encode_int32s([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_int32s([H|T], Bin) ->\n"
        code += "    encode_int32s(T, <<Bin/binary, H:32/signed>>).\n"

        code += "encode_uint32s([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_uint32s([H|T], Bin) ->\n"
        code += "    encode_uint32s(T, <<Bin/binary, H:32/unsigned>>).\n"

        code += "encode_int64s([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_int64s([H|T], Bin) ->\n"
        code += "    encode_int64s(T, <<Bin/binary, H:64/signed>>).\n"
        
        code += "encode_doubles([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_doubles([H|T], Bin) ->\n"
        code += "    encode_doubles(T, <<Bin/binary, H/float>>).\n"
        
        code += "encode_strings([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_strings([H|T], Bin) ->\n"
        code += "    Str = if is_bitstring(H) -> H; true -> list_to_binary(H) end,\n"
        code += "    StrLen = erlang:byte_size(Str),\n"
        code += "    encode_strings(T, <<Bin/binary, StrLen:16/unsigned, Str/binary>>).\n"
        
        code += "encode_bools([], Bin) ->\n"
        code += "    Bin;\n"
        code += "encode_bools([H|T], Bin) ->\n"
        code += "    case H  of\n"
        code += "       true ->\n"
        code += "           B = 1;\n"
        code += "       false ->\n"
        code += "           B = 0\n"
        code += "    end,\n"
        code += "    encode_bools(T, <<Bin/binary, B:8>>).\n"
        
        return code
       

    def _gene_intype_decode_repeated_code(self):
        code = ''
        code += "decode_bytes(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_bytes(Bin, List) ->\n"
        code += "    <<Int:8/signed, Bin2/binary>> = Bin,\n"
        code += "    decode_bytes(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_ubytes(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_ubytes(Bin, List) ->\n"
        code += "    <<Int:8/unsigned, Bin2/binary>> = Bin,\n"
        code += "    decode_ubytes(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_shorts(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_shorts(Bin, List) ->\n"
        code += "    <<Int:16/signed, Bin2/binary>> = Bin,\n"
        code += "    decode_shorts(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_ushorts(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_ushorts(Bin, List) ->\n"
        code += "    <<Int:16/unsigned, Bin2/binary>> = Bin,\n"
        code += "    decode_ushorts(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_int32s(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_int32s(Bin, List) ->\n"
        code += "    <<Int:32/signed, Bin2/binary>> = Bin,\n"
        code += "    decode_int32s(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_uint32s(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_uint32s(Bin, List) ->\n"
        code += "    <<Int:32/unsigned, Bin2/binary>> = Bin,\n"
        code += "    decode_uint32s(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_int64s(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_int64s(Bin, List) ->\n"
        code += "    <<Int:64/signed, Bin2/binary>> = Bin,\n"
        code += "    decode_int64s(Bin2, [Int|List]).\n"
        code += "\n"

        code += "decode_doubles(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_doubles(Bin, List) ->\n"
        code += "    <<Double/float, Bin2/binary>> = Bin,\n"
        code += "    decode_doubles(Bin2, [Double|List]).\n"
        
        code += "decode_strings(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_strings(Bin, List) ->\n"
        code += "    <<Len:16, Bin2/binary>> = Bin,\n"
        code += "    <<Str:Len/binary, Bin3/binary>> = Bin2,\n"
        code += "    decode_strings(Bin3, [binary_to_list(Str)|List]).\n"
        
        code += "decode_bools(<<>>, List) ->\n"
        code += "    List;\n"
        code += "decode_bools(Bin, List) ->\n"
        code += "    <<Int:8, Bin2/binary>> = Bin,\n"
        code += "    case Int of \n"
        code += "        1 ->\n"
        code += "            Bool = true;\n"
        code += "        _ ->\n"
        code += "            Bool = false\n"
        code += "    end,\n"
        code += "    decode_bools(Bin2, [Bool|List]).\n"
        
        return code

    def _gene_erlang_code(self, m):
        code = self._gene_erlang_encode_code(m)
        code += self._gene_erlang_decode_code(m)
        return code


    def _gene_erlang_encode_code(self, m):
        code = ''
        messageName = m.getName()
        fields = m.getFields()
        funcName = "encode_" + messageName
        if fields[0].name == "msg_id":
            funcName = "encode_" + fields[0].default

        if funcName in self.erlangEncodes:
            return ""
        self.erlangEncodes[funcName] = 1

        code += "%s(Record) when is_record(Record, %s) ->\n" % (funcName, messageName)
        code += "    #%s{" % messageName
        for field in fields:
            name = field.name
            vName = name.capitalize()
            code += "%s=%s," % (name, vName)

        code = self.trim(code, ",")
        code += "} = Record,\n"

        declareCode = ""
        assignCode = "    <<"

        for field in fields:
            name = field.name
            vName = name.capitalize()
            vNameFinal = vName+"Final"
            type = field.type
            dataType = field.dataType
            default = field.default if field.default else 'undefined'

            if type == 'required':
                code += "    %s =\n" % vNameFinal
                code += "    case %s =:= undefined of\n" % vName
                code += "        true ->\n"

                if default == 'undefined':
                    #code += "            %s = undefined,\n" % vNameFinal
                    code += "            throw({required_field_not_assigned, %s, %s}),\n" % (messageName, name)
                    code += "            undefined;\n"
                else:
                    code += "            %s;\n" % default

                code += "        false ->\n"
                code += "            %s\n" % vName


                code += "    end,\n"
            elif type == 'optional':
                code += "    case %s =:= undefined of\n" % vName
                code += "        true ->\n"
                if default == 'undefined':
                    if dataType in ['byte', 'ubyte', 'short', 'ushort', 'int32', 'uint32', 'int64']:
                        code += "                %s = 0;\n" % vNameFinal
                    elif dataType == 'double' or dataType == 'float':
                        code += "                %s = 0.0;\n" % vNameFinal
                    elif dataType == 'string':
                        code += "                %s = <<>>;\n" % vNameFinal
                    elif dataType == 'bool':
                        #默认的bool类型值为true(1)
                        code += "                %s = 1;\n" % vNameFinal
                    else:
                        #用0表示空message
                        code += "                %s = 0;\n" % vNameFinal
                        nullMessage = True

                else:
                    if dataType == 'bool':
                        if default == 'true':
                            default = 1
                        else:
                            default = 0

                    code += "               %s = %s;\n" % (vNameFinal, default)

                code += "        false ->\n"
                if dataType == 'bool':
                    code += "               case %s of\n" % vName
                    code += "                   true ->\n"
                    code += "                       %s = 1;\n" % vNameFinal
                    code += "                   false ->\n"
                    code += "                       %s = 0\n" % vNameFinal
                    code += "               end\n"
                else:
                    code += "           %s = %s\n" % (vNameFinal, vName)


                code += "    end,\n"
            else:
                #repeated类型需要特殊对待
                #repeated 类型编码规则     数组长度  数据长度(性能优化) 数据
                code += "    case %s =:= undefined of\n" % (vName)
                code += "        true ->\n"
                if default == 'undefined':
                    code += "            %s = [];\n" % (vNameFinal)
                else:
                    code += "            %s = %s;" % (vNameFinal, default)
                code += "        false ->\n"
                code += "            %s = %s\n" % (vNameFinal, vName)
                code += "    end,\n"

            if type == 'repeated':
                repeatedVName = (vName+"_bin").capitalize()
                funcName = "encode_%ss" % (dataType)
                declareCode += "    %s = %s(%s, <<>>),\n" % (repeatedVName, funcName, vNameFinal)
                self.erlEncodeRepeatedFuncArray[dataType] = funcName
                #填充数组大小，两个字节表示
                sizeVName = "Size%s" % (vNameFinal)
                declareCode += "    %s = erlang:length(%s),\n" % (sizeVName, vNameFinal)
                declareCode += "    BinLen_%s = erlang:byte_size(%s),\n" % (name, repeatedVName)
                assignCode += "%s:16, BinLen_%s:32, %s/binary," % (sizeVName, name, repeatedVName)
            else:
                if dataType == 'byte':
                    assignCode += "%s:8/signed," % (vNameFinal)
                elif dataType == 'ubyte':
                    assignCode += "%s:8/unsigned," % (vNameFinal)
                elif dataType == 'short':
                    assignCode += "%s:16/signed," % (vNameFinal)
                elif dataType == 'ushort':
                    assignCode += "%s:16/unsigned," % (vNameFinal)
                elif dataType == 'int32':
                    assignCode += "%s:32/signed," % (vNameFinal)
                elif dataType == 'uint32':
                    assignCode += "%s:32/unsigned," % (vNameFinal)
                elif dataType == 'int64':
                    assignCode += "%s:64/signed," % (vNameFinal)
                elif dataType == 'double' or dataType == 'float':
                    assignCode += "%s:64/float," % (vNameFinal)
                elif dataType == 'string':
                    declareCode += "    %s2 = if is_bitstring(%s) -> %s; true -> list_to_binary(%s) end,\n" % (vName, vNameFinal, vNameFinal, vNameFinal)
                    declareCode += "    %sLen = erlang:byte_size(%s2),\n" % (vName, vName)
                    #字符串的长度用两个字节表示
                    assignCode += "%sLen:16, %s2/binary," % (vName, vName)
                elif dataType == 'bool':
                    assignCode += "%s:8," % (vNameFinal)
                elif dataType == 'bytes':
                    assignCode += "%s/binary," % (vNameFinal)
                else:
                    #自定义类型
                    subMessage = self.allMessage.get(dataType)
                    if subMessage:
                        binVName = (vName + "_bin").capitalize()
                        funcName = "encode_" + dataType
                        declareCode += "    %s = %s(%s),\n" % (binVName, funcName, vNameFinal)
                        declareCode += "    BinLen_%s = erlang:byte_size(%s),\n" % (name, binVName)
                        if dataType not in self.inTypes:
                            self.erlEncodeFuncArray[dataType] = funcName

                        #复杂结构体:   bin长度  ,  bin
                        assignCode += "BinLen_%s:32, %s/binary," % (name, binVName)
                    else:
                        print ("unkown data type: ", dataType)

        assignCode = self.trim(assignCode, ",") + ">>;"
        code += declareCode + assignCode + "\n\n"

        if fields[0].name == "msg_id":
            code += "encode_%s(_) -> <<>>.\n" % (fields[0].default)
        else:
            code += "encode_%s(_) -> <<>>.\n" % (messageName)

        code += "\n"

        return code


    def _gene_erlang_encode_repeated_code(self, message):
        code = ''
        name = message.getName()
        funcName = "encode_%ss" % (name)
        #避免重复生成
        if funcName in self.erlangEncodes:
            return ''

        self.erlangEncodes[funcName] = 2

        code += "%s([], Bin) ->\n" % (funcName)
        code += "    Bin;\n"
        code += "%s([H|T], Bin) ->\n" % (funcName)
        code += "    NewBin = encode_%s(H),\n" % (name)
        code += "     NewBinSize = erlang:byte_size(NewBin),\n"
        code += "    %s(T, <<Bin/binary, NewBinSize:32, NewBin/binary>>).\n" % (funcName)
        return code


    def _gene_erlang_decode_code(self, m):
        messageName = m.getName()
        fields = m.getFields()
        funcName = "decode_%s" % messageName

        if fields[0].name == "msg_id":
            funcName = "decode_%s" % fields[0].default

        if funcName in self.erlangDecodes:
            return ""

        self.erlangDecodes[funcName] = 1

        code = "%s(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->\n" % funcName
        code += '    <<'
        i = 0

        sizeOfField = len(fields)

        constructCode = "    {%s, " % messageName
        ifBreak = False
        assignCode = ''

        k = 1
        for field in fields:
            type = field.type
            dataType = field.dataType
            name = field.name
            vName = name.capitalize()
            if type == 'repeated':
                sizeVName = "Size%s" % (name)
                lenVName = "BinLen%s" % (name)
                subBinVName = "SubBin%s" % (name)

                if k == sizeOfField:
                    if ifBreak:
                        code += "    <<_%s:16, _%s:32, %s/binary>> = Bin%s,\n" % (sizeVName, lenVName, subBinVName, i)
                    else:
                        code += "_%s:16, _%s:32, %s/binary>> = Bin%s,\n" % (sizeVName, lenVName, subBinVName, i)
                else:
                    j = i+1
                    if ifBreak:
                        code += "    <<_%s:16, %s:32, Bin%s/binary>> = Bin%s,\n" % (sizeVName, lenVName, j, i)
                    else:
                        code += "_%s:16, %s:32, Bin%s/binary>> = Bin%s,\n" % (sizeVName, lenVName, j, i)
                    i += 1
                    j = i+1
                    code += "    <<%s:%s/binary, Bin%s/binary>> = Bin%s, \n" % (subBinVName, lenVName, j, j-1)
                    i += 1

                code += "    %s = lists:reverse(decode_%ss(%s, [])),\n" % (vName, dataType, subBinVName)
                self.erlDecodeRepeatedFuncArray[dataType] = 2
                ifBreak = True
            else:
                if dataType == 'byte':
                    if ifBreak:
                        code += "    <<%s:8/signed," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:8/signed," % (vName)
                elif dataType == 'ubyte':
                    if ifBreak:
                        code += "    <<%s:8/unsigned," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:8/unsigned," % (vName)
                elif dataType == 'short':
                    if ifBreak:
                        code += "    <<%s:16/signed," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:16/signed," % (vName)
                elif dataType == 'ushort':
                    if ifBreak:
                        code += "    <<%s:16/unsigned," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:16/unsigned," % (vName)
                elif dataType == 'int32':
                    if ifBreak:
                        code += "    <<%s:32/signed," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:32/signed," % (vName)
                elif dataType == 'uint32':
                    if ifBreak:
                        code += "    <<%s:32/unsigned," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:32/unsigned," % (vName)
                elif dataType == 'int64':
                    if ifBreak:
                        code += "    <<%s:64/signed," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:64/signed," % (vName)
                elif dataType == 'double' or dataType == 'float':
                    if ifBreak:
                        code += "    <<%s:64," % (vName)
                        ifBreak = False
                    else:
                        code += "%s:64," % (vName)
                elif dataType == 'string':
                    strLenVName = "%sLen" % (vName)
                    j = i+1
                    if ifBreak:
                        code += "    <<%s:16, Bin%s/binary>> = Bin%s,\n" % (strLenVName, j, i)
                        ifBreak = False
                    else:
                        code += "%s:16, Bin%s/binary>> = Bin%s,\n" % (strLenVName, j, i)
                    i += 1
                    code += "    <<%s:%s/binary," % (vName, strLenVName)
                elif dataType == 'bool':
                    vNameTmp = vName + "Tmp"
                    if ifBreak:
                        code += "<<%s:8," % (vNameTmp)
                        ifBreak = False
                    else:
                        code += "%s:8," % (vNameTmp)

                    assignCode += "case %s of \n" % (vNameTmp)
                    assignCode += "    1 -> \n"
                    assignCode += "        %s = true;\n" % (vName)
                    assignCode += "    _ ->\n"
                    assignCode += "        %s = false\n" % (vName)
                    assignCode += "end,\n"
                elif dataType == 'bytes':
                    if ifBreak:
                        code += "  <<%s/binary," % (vName)
                        ifBreak = False
                    else:
                        code += "%s/binary," % (vName)
                else:
                    #复杂结构体类型，先读取长度(为什么读取长度，而不是直接传入二进制匹配？性能!)
                    subBinVName = "SubBin" + name
                    subBinSizeVName = "SubBinSize" + name

                    if k == sizeOfField:
                        if ifBreak:
                            code += "    <<_%s:32, %s/binary>> = Bin%s,\n" % (subBinSizeVName, subBinVName, i)
                        else:
                            code += "_%s:32, %s/binary>> = Bin%s,\n" % (subBinSizeVName, subBinVName, i)
                    else:
                        j = i + 1
                        if ifBreak:
                            code += "    <<%s:32, Bin%s/binary>> = Bin%s,\n" % (subBinSizeVName, j, i)
                        else:
                            code += "%s:32, Bin%s/binary>> = Bin%s,\n" % (subBinSizeVName, j, i)
                        i += 1
                        j = i + 1
                        code += "    <<%s:%s/binary, Bin%s/binary>> = Bin%s,\n" % (subBinVName, subBinSizeVName, j, i)
                        i += 1

                    code += "    %s = decode_%s(%s),\n" % (vName, dataType, subBinVName)
                    self.erlDecodeFuncArray[dataType] = 1
                    ifBreak = True

            constructCode += "%s," % (vName)

            k += 1

        constructCode = self.trim(constructCode, ",") + "};\n"
        code = self.trim(code, ",")

        if not ifBreak:
            code += ">> = Bin%s,\n" % (i)
            i += 1

        code += assignCode + constructCode + "\n"

        if fields[0].name == "msg_id":
            code += "decode_%s(_) ->\n" % (fields[0].default)
        else:
            code += "decode_%s(_) ->\n" % (messageName)

        code += "    undefined.\n\n"

        return code


    def _gene_erlang_decode_repeated_code(self, m):
        code = ''
        name = m.getName()
        funcName = "decode_%ss" % (name)
        #避免重复生成
        if funcName in self.erlangEncodes:
            return None

        self.erlangEncodes[funcName] = 2

        code += "%s(<<>>, List) ->\n" % (funcName)
        code += "    List;\n"
        code += "%s(Bin, List) ->" % (funcName)
        code += "    <<SubBinSize:32, Bin2/binary>> = Bin,\n"
        code += "    <<SubBin:SubBinSize/binary, Bin3/binary>> = Bin2,"
        code += "    TmpRecord = decode_%s(SubBin),\n" % (name)
        code += "    %s(Bin3, [TmpRecord|List]).\n" % (funcName)
        return code


def build_proto(proto_path, hrl_path, erl_path):
    f = open(proto_path)
    data = f.read()
    f.close()
    data = re.sub("/(option java_package = )\"(\w+).(\w+)\";/", "", data)
    data = re.sub("\/\/.*\n", "\n", data)

    generator = ProtoNifGenerator()
    hrlCode, erlCode = generator.geneErlang(data)

    f = open(hrl_path, 'w')
    f.write(hrlCode)
    f.close()
    f = open(erl_path, 'w')
    f.write(erlCode)
    f.close()

proto_path = sys.argv[1]
hrl_path = sys.argv[2]
erl_path = sys.argv[3]

build_proto(proto_path, hrl_path, erl_path)
print 'ok'