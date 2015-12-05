#!/usr/bin/env ruby

=begin
	This file is intended to test new locations to make sure you've written 
	the config file correctly.
=end

require_relative "location"

if( ARGV.size != 1 )
	puts "USAGE: #{__FILE__} <location_name>"
	exit(0)
end
filename = ARGV[0]

f = File.open("locations/#{filename}.txt", "r")
d = f.read()
loc = Location.new(d)
puts "Name: #{loc.name}\n"
puts "Description: #{loc.description}\n"
for ex in loc.getExits
	puts "\t#{ex} => #{loc.getExitDestination(ex)}"
end
