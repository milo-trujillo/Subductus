#!/usr/bin/env ruby

=begin
	The location class is responsible for storing all information about a single
	location in the game world. It parses a text blob describing a location, and
	stores data about the name, description, and exits. Information about the
	items or scenery in the location is stored separately.
=end

class Location
	attr_reader :description
	attr_reader :name

	def initialize(textblob)
		begin
			sections = textblob.split("#\n")
			@name = sections[0]
			@description = sections[2]
			@exits = Hash.new
			exits = sections[1].split("\n")
			for e in exits
				(descr, dest) = e.split(",")
				@exits.store(descr, dest)
			end
		rescue 
			raise "Invalid input file!"
		end
	end

	def getExits()
		return @exits.keys
	end

	def hasExit?(descr)
		return @exits.has_key?(descr)
	end

	# Returns a string with the name of the destination location, or nil
	# if the exit asked for does not exist
	def getExitDestination(descr)
		if( @exits.has_key?(descr) )
			return @exits[descr]
		end
		return nil
	end
end

f = File.open("locations/example_room.txt", "r")
d = f.read()
loc = Location.new(d)
puts "Name: #{loc.name}"
puts "Description: #{loc.description}"
for ex in loc.getExits
	puts "\t#{ex} => #{loc.getExitDestination(ex)}"
end
