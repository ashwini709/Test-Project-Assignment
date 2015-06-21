#!/usr/bin/env ruby
require_relative "arabic_converter"

## Command line input interface ##
if ARGV[0] 
	begin
		val = Integer(ARGV[0])
		testproject = TestProject.new(:num => val)
		testproject.arabic_to_eng		
	rescue ArgumentError
		puts "not valid, expected input: positive interger"
	end

else
	puts "expected input: positive interger"
	
end