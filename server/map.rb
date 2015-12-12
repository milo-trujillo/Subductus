#!/usr/bin/env ruby

=begin
	The map is responsible for tracking all locations, and may eventually
	have greater responsibility like tracking objects on the map.
=end

require_relative 'config'
require_relative 'location'
require_relative 'scenery'

module Map
	$locations = Hash.new
	$scenery = Hash.new
	def Map.loadLocations()
		locations = Dir.entries(Configuration::LocationsDir)
		locations = locations.select {
			|f| File.file?(Configuration::LocationsDir + "/" + f)
		}
		for i in (0 .. locations.size - 1)
			print "\rLoading locations [#{i + 1}]..."
			STDOUT.flush
			fname = locations[i]
			f = File.open(Configuration::LocationsDir + "/" + fname, "r")
			loc = Location.new(f.read)
			f.close
			$locations.store(loc.name, loc)
		end
		print "\n"
	end

	def Map.loadScenery()
		scenery = Dir.entries(Configuration::SceneryDir)
		scenery = scenery.select {
			|f| File.file?(Configuration::SceneryDir + "/" + f)
		}
		for i in (0 .. scenery.size - 1)
			print "\rLoading scenery [#{i + 1}]..."
			STDOUT.flush
			fname = scenery[i]
			f = File.open(Configuration::SceneryDir + "/" + fname, "r")
			sce = Scenery.new(f.read)
			f.close
			$scenery.store(sce.name, sce)
		end
		print "\n"
	end
end
