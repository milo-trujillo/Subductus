#!/usr/bin/env ruby

require 'base64'
require 'digest'
require 'zlib'

require_relative 'config'

class User
	attr_reader :lastLogin
	attr_reader :location
	attr_reader :email

	def initialize(username, password, email)
		@name = Base64.strict_encode(username)
		@password = Digest::SHA256.hexdigest(password + Configuration::UserPasswordSalt)
		@lastLogin = nil
		@location = Configuration::DefaultLocation
		@email = email
	end

	def username
		return Base64.decode(@name)
	end

	def name
		return username()
	end

	def passwordCorrect?(pass)
		if( @password == Digest::Sha256.hexdigest(pass + Salt) )
			return true
		else
			return false
		end
	end
end

module Users
	$users = []
	def addUser(username, email)
		pass = ""
		for x in (1 .. Configuration::DefaultPasswordLength)
			pass += rand(65 .. 122).chr
		end
		$users.push(User.new(username, pass, email))
		f = File.open(Configuration::NewUserEmail, "r")
		msg = f.read()
		f.close
		Mail.deliver do
			to email
			from Configuration::EmailAddress
			subject "Welcome to Subductus, #{username}"
			body "#{msg}#{pass}"
		end
	end
end
