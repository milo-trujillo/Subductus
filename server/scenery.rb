#!/usr/bin/env ruby

=begin
	This file is responsible for managing scenery. Scenery is defined as 
	objects that are a part of a room, and can therefore not be taken with you,
	but *can* be interacted with. All scenery can be examined with the "look"
	command, but scenery can also define verbs that apply to them to trigger
	additional actions.

	Scenery is constant with no state, and does not need to be saved to disk.
=end

class Scenery
	attr_reader :name # the full name of the scenery, referred to by locations
	attr_reader :shortname # name users refer to the scenery with
	attr_reader :description # Every piece of scenery has a description

	def initialize(textblob)
		begin
			sections = textblob.split("#\n")
			@name = sections[0]
			@shortname = sections[1]
			@description = sections[2]
		rescue
			raise "Invalid input file!"
		end
	end
end
