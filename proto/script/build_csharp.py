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

		messageName = messageDesc[8:messageDesc.find("}")]
		messageBody = messageDesc[messageDesc.find("{")+1:messageDesc.find("}")]
		_fields = messageBody.split("\n")
		fields = []
		for item in _fields:
			if item == "":
				continue
			fields.append(item.strip())

		pm = ProtoMessage(messageName.strip())

		for field in fields:
			info = re.find("[ \t]*(required|optional|repeated)[ \t]+(\w+)[ \t]*(\[default[ \t]*=[ \t]*([^\[\]]+)\])?;", field)
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
		#todo

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