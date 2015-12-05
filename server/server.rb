#!/usr/bin/env ruby

=begin
	This is the main server script, and the only one that should be launched
	from the command line to start the server.
=end

require 'socket'
require 'thread'

if( File.exists?("config.rb") )
	require_relative 'config'
else
	puts "ERROR: No configuration file found!"
	puts "Please copy config.rb.example to config.rb and edit it as needed."
	exit(0)
end
require_relative 'map'
require_relative 'client'
require_relative 'user'
require_relative 'state'


PortNumber = 5678

if $0 == __FILE__
	if( State.stateExists? )
		State.loadState
	else
		State.newState
	end
	serverSock = TCPServer.open(PortNumber)
	puts "World sunken. Initialization complete." 
	while( true )
		client = serverSock.accept
		Thread.start do
			puts "Client connected!"
			handleClient(client)
		end
	end
end
