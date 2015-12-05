#!/usr/bin/env ruby

=begin
	The map is responsible for tracking all locations, and may eventually
	have greater responsibility like tracking objects on the map.
=end

require_relative 'config'
require_relative 'location'

module Map
	$locations = Hash.new
	def Map.loadLocations()
		locations = Dir.entries(Configuration::LocationsDir)
		locations = locations.select {
			|f| File.file?(Configuration::LocationsDir + "/" + f)
		}
		for i in (0 .. locations.size - 1)
			print "\rLoading locations [#{i + 1}]..."
			fname = locations[i]
			f = File.open(Configuration::LocationsDir + "/" + fname, "r")
			loc = Location.new(f.read)
			f.close
			$locations.store(loc.name, loc)
		end
		print "\n"
	end
end
