#!/usr/bin/env ruby

=begin
	This file is intended to test new locations to make sure you've written 
	the config file correctly.
=end

require_relative "scenery"

if( ARGV.size != 1 )
	puts "USAGE: #{__FILE__} <scenery_name>"
	exit(0)
end
filename = ARGV[0]

f = File.open("scenery/#{filename}.txt", "r")
d = f.read()
sce = Scenery.new(d)
puts "Name: #{sce.name}\n"
puts "Shortname: #{sce.shortname}\n"
puts "Description: #{sce.description}\n"
