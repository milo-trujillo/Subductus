#!/usr/bin/env ruby

=begin
	The location class is responsible for storing all information about a single
	location in the game world. It parses a text blob describing a location, and
	stores data about the name, description, and exits. Information about the
	items or scenery in the location is stored separately.

	Locations are constant, they do not have a "state" you need to save to disk.
=end

require 'set'

class Location
	attr_reader :description
	attr_reader :name

	def initialize(textblob)
		begin
			sections = textblob.split("#\n")
			@name = sections[0]
			@description = sections[3]
			@exits = Hash.new
			exits = sections[1].split("\n")
			for e in exits
				(descr, dest) = e.split(",")
				@exits.store(descr, dest)
			end
			@scenery = Set.new
			for s in sections[2].split("\n")
				@scenery.add(s)
			end
		rescue 
			raise "Invalid input file!"
		end
	end

	def getScenery()
		return @scenery.to_a
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
