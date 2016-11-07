#!/usr/bin/env python
#encoding: utf-8
import threading
import time
import sys
import os
import xlrd
import md5
import re
import struct

## 二进制数打包格式
##[字段个数][字段类型+字段名长度+字段名]....[键值长度+键值+配置数据]...
##配置数据 = [数据类型 + 数据信息]
#          = array => 维度+数据类型+数据
#                       1 + 数据类型 + 数据
#                       2 + 数据类型 + 数组长度 + 数据
#                       数据类型 = string, 数据 = 数据个数 + [数据长度+数据]
#                       数据类型 = int,    数据 = 数据个数 + [数据]
#                       数据类型 = float,  数据 = 数据个数 + [数据]
#          = string => [数据长度+数据]
#          = int    => [数据]
#          = flooat => [数据]
def build(in_path, out_path):
	out_name = os.path.basename(out_path)
	module_name = out_path.split('.')[0]
	try:
		do_build(in_path, out_path)
	except:
		print "===error report===       %s unexcept error" % module_name

def do_build(in_path, out_path):
	out_name = os.path.basename(out_path)
	module_name = out_name.split('.')[0]
	patten_match = re.match('^[a-z,_]+$', module_name)
	if not(patten_match):
		print "%s file name illegal" % module_name
		return

	book = xlrd.open_workbook(in_path)
	sheet = book.sheet_by_index(0)
	col = sheet.col_values(0)
	file_out = col[0]
	if file_out.find("c#") == -1:
		return

	cs_data = ""
	binary_data = ""
	key = []
	key_count = 0
	fields_len = 0
	values_binary = []
	binary_fields = ""
	bytes = ""
	last_field = 0

	cs_data = "using System;\nusing System.Collections.Generic;\n"\
	+"using System.Linq;\nusing System.Text;\n"\
	+"[System.Serializable]\n"\
	+"public class %s : IConfig<string>\n{\n" % to_cs_module_name(module_name)
	cs_data += "    public string key;\n"

	for x in range(0, sheet.nrows):
		values_binary.append("")
		key.append("")

	for x in range(0, sheet.ncols):
		col_data = sheet.col_values(x)
		if col_data[4] == "c" or col_data[4] == "cs":
			last_field = x

	for i in range(0, sheet.ncols):
		col_data = sheet.col_values(i)
		data_type = ""
		dim = 0;
		array_type = ""
		for y in range(2, sheet.nrows):
			if y == 2:
				pass
			elif y ==3:
				data_type = col_data[3].lower()
				if data_type == "array":
					array_type = get_array_type(col_data[6])
					dim = get_array_type(col_data[6])
			elif y == 4:
				if col_data[4] == "c" or col_data[4] == "cs":
					if data_type == "array":
						int_type = 3
						type_name = parse_type_name(dim, array_type)
						cs_data += "    public %s %s;\n" % (type_name, col_data[2])
						name_len = len(col_data[2])
						fmt = "ii%is" % name_len
						binary_fields += struct.pack(fmt, int_type, name_len, str(col_data[2]))
					else:
						if data_type == "int":
							int_type = 1
						elif data_type == "float":
							int_type = 4
						else:
							int_type = 2
						cs_data += "    public %s %s;\n" % (data_type, col_data[2])
						name_len = len(col_data[2])
						fmt = "ii%is" % name_len
						binary_fields += struct.pack(fmt, int_type, name_len, str(col_data[2]))
					fields_len += 1
			elif y == 5:
				pass
			else:
				if col_data[4] != "c" and col_data[4] != "cs":
					break;
				if col_data[5] == "key":
					if not check_data_type(col_data[y], "int"):
						print "key must be int:line %s row %s in %s" % (y+1, i+1, module_name[:-4])
						exit()
					value_binary = struct.pack("i", int(col_data[y]))
					values_binary[y] += value_binary
					key[y] += "-" + str(int(col_data[y]))
				elif data_type == "int":
					if not col_data[y]:
						col_data[y] = 0
					if not check_data_type(col_data[y], "int"):
						print "data is not int:line:line %s row %s in %s" % (y+1, i+1, module_name[:-4])
						exit()
					value_binary = struct.pack("i", int(col_data[y]))
					values_binary[y] += value_binary
				elif data_type == "float":
					if not col_data[y]:
						col_data[y] = 1.0
					value_binary = struct.pack("f", float(col_data[y]))
					values_binary[y] += value_binary
				elif data_type == "string":
					if not col_data[y]:
						col_data[y] = ""
					if type(col_data[y]) == float:
						col_data[y] = int(col_data[y])
					col_data[y] = "%s" % col_data[y]
					encode_data = col_data[y].encode('utf-8')
					#encode_data = repr(col_data[y])
					#print "value = %s, len = "%i" % (col_data[y], len(encode_data))
					value_binary = struct.pack("i%is" % len(encode_data), len(encode_data), encode_data)
					values_binary[y] += value_binary
				elif data_type == "array":
					if not col_data[y]:
						col_data[y] = "[]"
					if is_legal_data(dim, col_data[y], module_name):
						#value_binary = 
						value_binary = struct_array(array_type, dim, col_data[y])
						values_binary += value_binary
					else:
						print "line %s row %s: wrong data type in %s" % (y+1, i+1, module_name)
						exit()
				else:
					print "line %s row %s: wrong data type in %s" % (y+1, i+1, module_name)
					exit()
			if i == last_field and y > 5:
				key_binary = str(key[y][1:])
				key_binary = key_binary.encode('utf-8')
				key_binary = struct.pack("i%is" % len(key_binary), len(key_binary), key_binary)
				binary_data += key_binary
				binary_data += values_binary[y]
	cs_data += "    public string GetKey()\n    {\n        return key;\n    }\n}"

	dat_file_name = to_binary_file_name(module_name)
	dat_file = '%s/%s' % (os.path.dirname(out_path), dat_file_name)
	bytes = struct.pack('i', fields_len)
	bytes += binary_fields
	bytes += binary_data
	f = open(dat_file, 'wb')
	print >> f, bytes
	#print dat_file_name
	f.close()
	cs_file_name = to_cs_file_name(module_name)
	cs_file = "%s/%s" % (os.path.dirname(out_path), cs_file_name)
	cs_f = open(cs_file, 'w')
	print >> cs_f, cs_data.encode("utf-8")
	#print cs_file_name
	f.close()

def check_data_type(data, type):
	try:
		type = type.split("-")
		if type[0] == "int":
			data = int(data)
		elif type[0] == "string":
			pass
		elif type[0] == "array":
			pass
		return True
	except:
		return False

def is_legal_data(dim, data, module_name):
	if data == "[]":
		return True
	stack = []
	if dim == 0:
		print "wrong array in %s" % module_name
		exit()
	elif dim > 2:
		print "array too deep in %s" % module_name
		return False
	if is_array_complete(data) == False:
		print "array data is not complete in %s" % module_name
		return False
	for tmp in data:
		if tmp == '[' or tmp == '{':
			dim -=1
		else:
			break
	if dim == 0:
		for ch in data:
			if ch == '[' or ch == '{':
				stack.append(ch)
			elif ch == ']':
				if stack.pop() != '[':
					return False
			elif ch == '}':
				if stack.pop() != '{':
					return False
	else:
		return False
	if len(stack) != 0:
		return False
	return True

def parse_type_name(dim, data_type):
	type_name = data_type
	for temp in range(0, dim):
		type_name = "List<%s>" % type_name
	return type_name

def to_cs_file_name(file_name):
	file_name = "%sVo.cs" % file_name.capitalize()
	return file_name

def to_cs_module_name(file_name):
	module_name = "%sVo" % file_name.capitalize()
	return module_name

def to_binary_file_name(file_name):
	file_name = "%sVo.bytes" % file_name.capitalize()
	return file_name

def get_array_dim(data):
	dim = 0
	for ch in data:
		if ch == '[' or ch == '{':
			dim += 1
		else:
			break
	return dim

def get_array_type(data):
	first_data = ""
	for ch in data:
		if ch == ',' or ch == '}' or ch == ']':
			break
		if ch == '[' or ch == '{':
			continue
		if ch == '-':
			continue
		else:
			first_data += ch
	if first_data.isdigit():
		return "int"
	return "string"

def is_array_complete(data):
	if data.find("[,") != -1:
		return False
	if data.find("{,") != -1:
		return False
	if data.find(",]") != -1:
		return False
	if data.find(",}") != -1:
		return False
	return True

def get_dir_all_file(path):
	all_file = []
	for root, dirs, files in os.walk(path):
		for filepath in files:
			all_file.append(os.path.join(root, filepath))
	return all_file

def struct_array(array_type, dim, data):
	if array_type == "int":
		array_type = 1
	if array_type == "string":
		array_type = 2
	result = struct.pack("i", dim)
	#
	if data == "[]":
		result = struct.pack("iii", dim, array_type, 0)
		return result
	if dim == 1:
		data = split_to_array(data)
		if is_num(data[0]):
			result += struct.pack("i", array_type)
		else:
			result += struct.pack("i", array_type)
		result += pack_data(data)
	else:
		i = 0
		data = string_to_multi_array(data)
		if is_num(data[0][0]):
			result += struct.pack("i", 1)
		else:
			result += struct.pack("i", 2)
		result += struct.pack("i", len(data))
		for elem in data:
			result += pack_data(elem)
	return result

def pack_data(data):
	result = struct.pack("i", len(data))
	if is_num(data[0]):
		for elem in data:
			result += struct.pack("i", int(elem))
	else:
		for elem in data:
			elem = elem.encode('utf-8')
			result += struct.pack("i%is" % len(elem), len(elem), elem)
	return result

def split_to_array(data):
	data_array = data.replace("{", "")
	data_array = data_array.replace("[", "")
	data_array = data_array.replace("}", "")
	data_array = data_array.replace("]", "")
	data_array = data_array.replace(" ", "")
	data_array = data_array.split(",")
	return data_array

def string_to_multi_array(data):
	data = data.split("},")
	new_data = []
	for elem in data:
		elem = split_to_array(elem)
		new_data.append(elem)
	return new_data

def is_num(string):
	for ch in string:
		if ch == '-':
			continue
		elif ch.isdigit():
			continue
		else:
			return False
	return True

def build_errcode_file():
	book = xlrd.open_workbook("./excel/error_code.xlsx")
	sheet.book.sheet_by_index(0)

	context = "namespace Engine\n{\n    class ErrCode\n    {"
	for i in range(6, sheet.nrows):
		row_data = sheet.row_values(i)
		context += "\n        static public readonly int %s = %s;" % (row_data[1], int(row_data[0]))

	context += "\n    }\n}"
	f = open("./csharp/ErrCode.cs", 'w')
	print >> f, context.encode('utf-8')
	f.close()

in_path = sys.argv[1]
out_path = sys.argv[2]
file_list = get_dir_all_file(in_path)
all_thread = []
start_time = time.time()

for item in file_list:
	portion = os.path.splitext(item)
	if portion[1] == ".xlsx" or portion[1] == ".xls" or portion[1] == ".xlsm":
		out_name = os.path.basename(portion[0])
		real_out_path = "%s/%s" % (out_path, out_name)
		thread = threading.Thread(target=build, args=(item, real_out_path))
		thread.start()
		all_thread.append(thread)

for thread in all_thread:
	thread.join()

#build_errcode_file()

print "ok", time.time() - start_time