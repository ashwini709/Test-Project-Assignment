#!/usr/bin/env ruby
require_relative "number_map.rb"

class TestProject
	include NumberMap

	attr_reader :options

	def initialize(options={})
		@options = options
	end

	#string to store the final result
	@@english_numeral = ''

	## base function: conversion based of range of number ##
	def arabic_to_eng
		validate_input

		case @num
		when "NAN"
			puts "not valid, expected input: positive interger"
			return false

		when 0..19
			convert_specials(@num)

		end
		final_result

	end
	
	## validates the input number 
	def validate_input
		if @options[:num].is_a?(Integer) and @options[:num] >= 0 
			@num = @options[:num].to_i.abs 
		else
			@num = "NAN"
		end
	end

	## Numbers below 20 are unique ##
	def convert_specials(val)
		if val < 20
			@@english_numeral += "#{BASIC_MAP[val]}" + ' ' 
		end
	end

	## prints the final string of english numeral ##
	def final_result
		result = @@english_numeral.strip
		@@english_numeral.clear
		
		puts result
		return result

	end
end
