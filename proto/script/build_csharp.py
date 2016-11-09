#!/usr/bin/env python
# encoding: utf-8
"""
"""

import sys
import re
import copy


proto_path = sys.argv[1]
csharp_path = sys.argv[2]

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
			# fieldObj.unique = info[3].strip()
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
		# self.unique = None
		self.default = None


class ProtoNifGenerator:

	def __init__(self):
		self.allMessage = {}

		self.inTypes = ['byte', 'short', 'ushort', 'int32', 'uint32', 'int64', 'uint64', 'string', 'bytes']


	def geneCsharp(self, string, path):
		pb = ProtoParse()
		self.allMessage = pb.parse(string)

		proto_define = ""
		proto_dict = ""
		for name, message in self.allMessage.iteritems():
			#
			# print name
			types = name.split("__")
			if len(types) == 4:
				if types[3] in ["s2l", "l2s"]:
					#
					continue

			if len(types) < 4:
				protocode = self._gene_proto_p_code(message)
			else:
				proto_define += self._gene_proto_define_code(message)
				proto_dict += self._gene_proto_dict_code(message)
				protocode = self._gene_proto_m_code(message)
			proto_path = path + "/%s.cs" % name
			f = open(proto_path, 'w')
			f.write(protocode)
			f.close()

		mapcode = self._gene_proto_map_code(proto_define, proto_dict)

		map_path = path + "/ProtoMap.cs"
		f = open(map_path, 'w')
		f.write(mapcode)
		f.close()


	def _proto_type_2_csharp_type(self, dataType):
		if dataType == 'int32':
			return 'Int32'
		elif dataType == 'uint32':
			return 'UInt32'
		elif dataType == 'int64':
			return 'Int64'
		elif dataType == 'uint64':
			return 'UInt64'
		else:
			return dataType

	def _csharp_type_default_value(self, default, dataType):
		if default != None:
			return default
		else:
			if dataType in ['byte', 'short', 'Int32', 'Int64', 'float', 'double']:
				return 0
			elif dataType == 'bool':
				return 'false'
			elif dataType == 'string':
				return '\"\"'

	def _gene_proto_p_code(self, m):
		messageName = m.getName()
		fields = m.getFields()
		types = messageName.split("__")

		code = "using System;\n"
		code += "using Engine;\n"
		code += "using System.Collections.Generic;\n"

		code += "public class %s : ProtoBase\n" % messageName
		code += "{\n"

		for field in fields:
			#
			if field.dataType not in self.inTypes and field.dataType.split("_")[0] != "p":
				print("Error ！unsupported proto field type \"%s\" in message : \"%s\" !" % (field.dataType, messageName))
				sys.exit()
			dataType = self._proto_type_2_csharp_type(field.dataType)
			#
			if field.type == "repeated":
				code += "    public List<%s> %s = new List<%s> ();\n" % (dataType, field.name, dataType)
			elif field.dataType.split("_")[0] == "p":
				code += "    public %s %s = new %s ();\n" % (dataType, field.name, dataType)
			#
			#
			#
			else:
				code += "    public %s %s;\n" % (dataType, field.name)

		code += "    public %s()\n" % messageName
		code += "    {\n\n"
		#
		code += "    }\n"
		#
		#
		#
		#

		code += "    public override void read(ByteArray byteArray)\n"
		code += "    {\n"
		#

		has_repeated = False

		for field in fields:
			dataType = self._proto_type_2_csharp_type(field.dataType)
			defaultValue = self._csharp_type_default_value(None, dataType)

			if field.type == 'repeated':
				if has_repeated == False:
					code += "        short sLen = 0;\n"
					code += "        int i = 0;\n"
					has_repeated = True
				code += "\n        sLen = byteArray.Readshort();\n"
				code += "        for (i = 0; i < sLen; i++) {\n"
				if dataType.split("_")[0] == "p":
					code += "        %s k%s = new %s ();\n" % (dataType, dataType, dataType)
					code += "        k%s.read(byteArray);\n" % dataType
					code += "        %s.Add(k%s);\n" % (field.name, dataType)
				else:
					code += "        %s.Add(byteArray.Read%s());\n" % (field.name, dataType)
				code += "        }\n"
			elif dataType.split("_")[0] == "p":
				code += "        %s.read(byteArray);\n" % field.name
			else:
				code += "        %s = byteArray.Read%s();\n" % (field.name, dataType)
		code += "    }\n"


		code += "    public override void write(ByteArray byteArray)\n"
		code += "    {\n"
		#

		has_repeated = False

		for field in fields:
			dataType = self._proto_type_2_csharp_type(field.dataType)
			if field.type == 'repeated':
				if has_repeated == False:
					code += "        short sLen = 0;\n"
					code += "        int i = 0;\n"
					has_repeated = True
				code += "\n        sLen = (short)%s.Count;\n" % field.name
				code += "        byteArray.Writeshort(sLen);\n"
				code += "        for (i = 0; i < sLen; i++) {\n"
				if dataType.split("_")[0] == "p":
					code += "            %s[i].write(byteArray);\n" % field.name
				else:
					code += "            byteArray.Write%s(%s[i]);\n" % (dataType, field.name)
				code += "        }\n"
			elif dataType.split("_")[0] == "p":
				code += "\n        %s.write(byteArray);\n" % field.name
			else:
				code += "        byteArray.Write%s(%s);\n" % (dataType, field.name)
		code += "    }\n"

		code += "}\n"

		return code
		#

	def _gene_proto_m_code(self, m):
		messageName = m.getName()
		msg_id = 0
		fields = m.getFields()
		if fields[0].name == "msg_id":
			msg_id = fields[0].default
		types = messageName.split("__")

		code = "using System;\n"
		code += "using Engine;\n"
		code += "using System.Collections.Generic;\n"

		code += "public class %s : ProtoBase\n" % messageName
		code += "{\n"

		for field in fields[1:]:
			#
			if field.dataType not in self.inTypes and field.dataType.split("_")[0] != "p":
				print("Error ！unsupported proto field type \"%s\" in message : \"%s\" !" % (field.dataType, messageName))
				sys.exit()
			dataType = self._proto_type_2_csharp_type(field.dataType)
			#
			if field.type == "repeated":
				code += "    public List<%s> %s = new List<%s> ();\n" % (dataType, field.name, dataType)
			elif field.dataType.split("_")[0] == "p":
				code += "    public %s %s = new %s ();\n" % (dataType, field.name, dataType)
			elif types[3] == "c2s" and field.type == "optional":
				defaultValue = self._csharp_type_default_value(field.default, dataType)
				code += "    public %s %s = %s;\n" % (dataType, field.name, defaultValue)
			else:
				code += "    public %s %s;\n" % (dataType, field.name)

		code += "    public %s()\n" % messageName
		code += "    {\n"
		code += "        proto_id = %s;\n" % msg_id
		code += "    }\n"
		if types[3] == "c2s":
			code += "    public override void write(ByteArray byteArray)\n"
			code += "    {\n"
			code += "        base.write(byteArray);\n"
			code += "        byteArray.WriteInt32(proto_id);\n"
		else:
			code += "    public override void read(ByteArray byteArray)\n"
			code += "    {\n"
			code += "        base.read(byteArray);\n"

		has_repeated = False

		for field in fields[1:]:
			dataType = self._proto_type_2_csharp_type(field.dataType)
			defaultValue = self._csharp_type_default_value(None, dataType)
			if types[3] == "c2s":
				if field.type == "repeated":
					if has_repeated == False:
						code += "        short sLen = 0;\n"
						code += "        int i = 0;\n"
						has_repeated = True
					code += "\n        sLen = (short)%s.Count;\n" % field.name
					code += "        byteArray.Writeshort(sLen);\n"
					code += "        for (i = 0; i < sLen; i++) {\n"
					if dataType.split("_")[0] == "p":
						code += "            %s[i].write(byteArray);\n" % field.name
					else:
						code += "            byteArray.Write%s(%s[i]);\n" % (dataType, field.name)
					code += "        }"
				elif dataType.split("_")[0] == "p":
					code += "\n        %s.write(byteArray);\n" % field.name
				else:
					code += "        byteArray.Write%s(%s);\n" % (dataType, field.name)
			elif types[3] == "s2c":
				if field.type == 'repeated':
					if has_repeated == False:
						code += "        short sLen = 0;\n"
						code += "        int i = 0;\n"
						has_repeated = True
					code += "\n        sLen = byteArray.Readshort();\n"
					code += "        for (i = 0; i < sLen; i++) {\n"
					if dataType.split("_")[0] == "p":
						code += "            %s k%s = new %s ();\n" % (dataType, dataType, dataType)
						code += "            k%s.read(byteArray);\n" % dataType
						code += "            %s.Add(k%s);\n" % (field.name, dataType)
					else:
						code += "            %s.Add(byteArray.Read%s());\n" % (field.name, dataType)
					code += "        }\n"
				elif dataType.split("_")[0] == "p":
					code += "        %s.read(byteArray);\n" % field.name
				else:
					code += "        %s = byteArray.Read%s();\n" % (field.name, dataType)
		code += "    }\n"
		code += "}\n"

		return code

	def _gene_proto_define_code(self, m):
		code = ""
		messageName = m.getName()
		msg_id = 0
		fields = m.getFields()
		if fields[0].name == "msg_id":
			msg_id = fields[0].default

		code += "        public static readonly int %s = %s;\n" % (messageName, msg_id)
		return code

	def _gene_proto_dict_code(self, m):
		code = ""
		messageName = m.getName()
		code += "            m_DicProtoType[%s] = typeof(%s);\n" % (messageName, messageName)
		return code

	def _gene_proto_map_code(self, proto_define, proto_dict):
		code = "using System;\n"
		code += "using Engine;\n"
		code += "using System.Collections.Generic;\n"
		code += "namespace Engine \n"
		code += "{\n"
		code += "    public class ProtoMap : Singleton<ProtoMap>\n"
		code += "    {\n"
		code += "        private Dictionary<int, Type> m_DicProtoType;\n"
		code += "        public ProtoBase GetProto(int uiProtoID)\n"
		code += "        {\n"
		code += "            Type kProtoType;\n"
		code += "            m_DicProtoType.TryGetValue(uiProtoID, out kProtoType);\n"
		code += "            if (kProtoType != null)\n"
		code += "            {\n"
		code += "                ProtoBase kProto = null;\n"
		code += "                kProto = Activator.CreateInstance(kProtoType) as ProtoBase;\n"
		code += "                return kProto;\n"
		code += "            }\n"
		code += "            else\n"
		code += "            {\n"
		code += "                return null;\n"
		code += "            }\n"
		code += "        }\n"
		code += proto_define
		code += "        public ProtoMap()\n"
		code += "        {\n"
		code += "            m_DicProtoType = new Dictionary<int, Type>();\n"
		code += proto_dict
		code += "        }\n"
		code += "    }\n"
		code += "}\n"
		return code


def build_proto(proto_path, csharp_path):
	f = open(proto_path)
	data = f.read()
	f.close()
	#
	data = re.sub("\/\/.*\n", "\n", data)
	#

	generator = ProtoNifGenerator()
	generator.geneCsharp(data, csharp_path)

	#
	#
	#

build_proto(proto_path, csharp_path)
print 'ok'