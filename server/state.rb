#!/usr/bin/env ruby

=begin
	This code is responsible for saving and restoring program state, and
	does program initialization if no state is available.
=end

require_relative 'config'
require_relative 'map'

module State
	def State.stateExists?()
		if( File.directory?(Configuration::StateDir) )
			for f in Configuration::StateFiles
				unless( File.file?(f) )
					return false
				end
			end
			return true
		else
			return false
		end
	end

	def State.saveState()
		unless( File.directory?(Configuration::StateDir) )
			Dir.mkdir(Configuration::StateDir)
		end
		# Map.saveState(Configuration::MapStateFile)
		# Users.saveState(Configuration::UsersStateFile)
	end

	def State.loadState()
		Map.loadState(Configuration::MapStateFile)
		Users.loadState(COnfiguration::UsersStateFile)
	end

	def State.newState()
		Map.loadLocations
		Map.loadScenery
	end
end
