#!/bin/python

# get filename from argv.
# read file into 2d array
# write 2d array into proper format for whatever language we're working with.

def read_file(filename):
	with open(filename, 'r') as fp:
		return fp.read()

def build_array(filename)
	file_contents = read_file(filename)
	file_array = []
	for line in file_contents.split('\n'):
		file_array.push( [ int(x) for x in line.split() ] )
	return file_array

def to_ruby(variable_name, filename):
	internal_rep = build_array(filename)
	print "$", variable_name, " = [\n"
	# ruby doesn't seem to care about extra ,'s in lists. other languages
	# might be more picky though, so I may need to look into a generator.
	for sublist in internal_rep:
		print "["
		for item in sublist:
			print item, ","
		print "],\n"
	print "]\n"

def to_erlang(variable_name, filename):
	# minor optimization: read the file only once. future TODO.
	internal_rep = build_array(filename)

