#!/bin/env ruby

lane_length, cases = ARGF.readline.split.map { |item| item.to_i }
lane_widths = ARGF.readline.split.map { |item| item.to_i }

(1..cases).each { |case_num|
	entry_point, exit_point = ARGF.readline.split.map { |item| item.to_i }
	puts lane_widths[entry_point..exit_point].min
}