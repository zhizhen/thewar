#!/usr/bin/env python
# encoding: utf-8
import threading
import time
import sys
import os
import xlrd
import md5
import re

def build(in_path, out_path):
	out_name = os.path.basename(out_path)
	module_name = out_name.split('.')[0]
	try:
		do_build(in_path, out_path)
	except:
		print "===error report==        %s unexpect error " % module_name[:-4]

def do_build(in_path, out_path):
	out_name = os.path.basename(out_path)
	module_name = out_name.split('.')[0]
	patten_match = re.match('^[a-z,_]+$', module_name)
	if not(patten_match):
		print "%s file name illegal" % module_name[:-4]
		return

	book = xlrd.open_workbook(in_path)
	sheet = book.sheet_by_index(0)
	col = sheet.col_values(0)
	file_out = col[0]
	if file_out.find("erlang") == -1:
		return

	keys = []
	data = []
	last_field = 0
	all_key = ""
	key_count = 0
	tmp_data = ""
	str_append = ""

	context = "-module(%s).\n" % module_name
	context += "-export([find/1, keys/0]).\n"
	context += "-export([foldl/2, filter/1]).\n"

	for x in range(0, sheet.nrows):
		data.append("")
		keys.append([])

	for x in range(0, sheet.ncols):
		col_data = sheet.col_values(x)
		if col_data[4] == "s" or col_data[4] == "cs":
			last_field = x
		if col_data[5] == "key":
			key_count += 1

	for i in range(0, sheet.ncols):
		col_data = sheet.col_values(i)
		value = ""
		data_type = ""
		for y in range(2, sheet.nrows):
			if y == 2:
				pass
			elif y == 3:
				data_type = col_data[3].lower()
			elif y == 4:
				pass
			elif y == 5:
				pass
			else:
				if col_data[4] != "s" and col_data[4] != "cs":
					break
				if col_data[5] == "key":
					if not check_data_type(col_data[y], "int"):
						print "key must be int: line %s row %s in %s" % (y + 1, i + 1, module_name[:-4])
						exit()
					value = int(col_data[y])
					keys[y].append(str(value))
				elif data_type == "int":
					if not col_data[y]:
						col_data[y] = 0
					if not check_data_type(col_data[y], "int"):
						print "key must be int: line %s row %s in %s" % (y + 1, i + 1, module_name[:-4])
						exit()
					value = int(col_data[y])
				elif data_type == "float":
					if not col_data[y]:
						col_data[y] = 1.0
					value = float(col_data[y])
				elif data_type == "string":
					if not col_data[y]:
						col_data[y] = ""
					if type(col_data[y]) == float:
						col_data[y] = int(col_data[y])
					else:
						col_data[y] = col_data[y].replace('"', '\\"')
					value = '"%s"' % col_data[y]
				else:
					if not col_data[y]:
						col_data[y] = "[]"
					if not(is_legal_data(col_data[y])):
						print "line %s row %s: wrong array in %s" % (y + 1, i + 1, module_name)
					if is_chinese(col_data[y]):
						value = '%s' % col_data[y]
					else:
						value = col_data[y]
				values = "\n      %s => %s," % (col_data[2], value)
				data[y] += values
			if i == last_field and y > 5:
				if len(keys[y]) > 1:
					key = "{" + ",".join(keys[y]) + "}"
				else:
					key = "%s" % keys[y][0]
				all_key += "%s," % key
				fun = "\nfind(%s) ->\n    #{    %s\n    };\n" % (key, data[y][:-1])
				tmp_data += fun

	if key_count == 1:
		context += "-export([floor/1, ceil/1]).\n"
		str_append = "ceil(Num) -> \n"\
				+ "    case [X || X <- lists:sort(keys()), X >= Num] of\n"\
				+ "        [H|_] ->\n"\
				+ "            find(H);\n"\
				+ "        _ ->\n"\
				+ "            false\n"\
				+ "    end.\n\n"
		str_append += "floor(Num) -> \n"\
				+ "    case [X || X <- lists:sort(keys()), X =< Num] of\n"\
				+ "        [] ->\n"\
				+ "            false;\n"\
				+ "        List ->\n"\
				+ "            find(lists:last(List))\n"\
				+ "    end.\n\n"
	context += tmp_data
	context += "\nfind(_K) -> \n    false.\n\n"
	context += "keys() -> \n    [%s].\n\n" % all_key[:-1]
	context += "filter(Fun) ->\n    List = keys(),\n    lists:filter(Fun, List).\n\n"
	context += "foldl(Fun, Acc) ->\n    List = keys(),\n    lists:foldl(Fun, Acc, List).\n\n"
	context += str_append
	f = open(out_path, 'w')
	print >> f, context.encode("utf-8")
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

def is_chinese(check_str):
	for ch in check_str:
		if u'\u4e00' <= ch <= u'\u9fff':
			return True
	return False

def is_legal_data(data):
	if data == "[]":
		return True
	stack = []
	for ch in data:
		if ch == '[' or ch == '{':
			stack.append(ch)
		elif ch == ']':
			if stack.pop() != '[':
				return False
		elif ch == '}':
			if stack.pop() != '{':
				return False
	if len(stack) != 0:
		return False
	return True

def get_dir_all_file(path):
	all_file = []
	for root, dirs, files, in os.walk(path):
		for filepath in files:
			all_file.append(os.path.join(root, filepath))
	return all_file

def build_errcode_file():
	book = xlrd.open_workbook("./excel/error_code.xlsx")
	sheet = book.sheet_by_index(0)

	context = "%%%----------------------------------------------------------------------\n"
	context += "%%%\n"
	context += "%%% @author:   zhizhen\n"
	context += "%%% @doc \n"
	context += "%%% @end \n"
	context += "%%%----------------------------------------------------------------------\n\n"
	for i in range(6, sheet.nrows):
		row_data = sheet.row_values(i)
		context += '-define(%-30s        %s).    %%%% %s\n' % (row_data[1]+',', int(row_data[0]), row_data[3])


	f = open("./erlang/errcode.hrl", 'w')
	print >> f, context.encode("utf-8")
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
		real_out_path = '%s/%s_dat.erl' % (out_path, out_name)
		thread = threading.Thread(target = build, args = (item, real_out_path))
		thread.start()
		all_thread.append(thread)

for thread in all_thread:
	thread.join()

build_errcode_file()

print "ok", time.time() - start_time