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

		when 0
			puts "zero"
			return "zero"

		when 1..999
			convert_smaller_than_thousand(@num)

		else
			convert_larger_than_thousand(@num)

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

	## convert numbers less than 1000 to english numerals ##
	## pattern of hundred tens units ##
	## It is going to repeat for every higher exponent ##
	def convert_smaller_than_thousand(val)
		if val >= 100
			v1 = val/100
			val -= v1*100

			# Gives you a number of hundred tens units pattern 
			convert_hundred(v1)
			set_exponent(2)
			convert_hundred(val)
			
		else
			convert_hundred(val)

		end
	end

	## convert numbers greater than and equal to 1000 to english numerals ##
	def convert_larger_than_thousand(val)
		return if val == 0

		#exponent of the input number
		exp = (Math.log10(val)).to_i.abs

		exp_available = 3*(exp/3) 
		exp_num = 10**exp_available

		while exp_available >= 0
			if val >= exp_num
				v1 = val/exp_num
				val -= v1*exp_num

				convert_smaller_than_thousand(v1)
				set_exponent(exp_available)
				convert_larger_than_thousand(val)
			end

			exp_available -= 3

		end
	end

	## Base function: converts numbers less than 100 to english numerals ##
	def convert_hundred(val)
		if val < 19
			@@english_numeral += "#{BASIC_MAP[val]}" + ' ' 

		else
			num1 = val%10
			num2 = val-num1

			@@english_numeral += "#{BASIC_MAP[num2]}" + ' ' + "#{BASIC_MAP[num1]}" + ' '
		end
	end

	## set the english conversion of the exponents as per EXPONENTS map ##
	def set_exponent(exp)
		case 
		when (exp%3 == 1 and exp > 3)
			@@english_numeral += "ten #{EXPONENTS[exp]}" + ' ' 

		when (exp%3 == 2 and exp > 3)
			@@english_numeral += "hundred #{EXPONENTS[exp]}" + ' '

		else
			@@english_numeral += "#{EXPONENTS[exp]}" + ' '

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
