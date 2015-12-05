#!/usr/bin/env ruby

=begin
	This file contains all code handling the client socket after it is created.
=end

require 'socket'

def handleClient(sock)
	sock.print("Username: ")
	username = sock.gets
	sock.print("Password: ")
	password = sock.gets
	sock.puts("Welcome to Subductus.")
	sock.close
end
