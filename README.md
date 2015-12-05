# Subductus

Subductus takes place on Drowned Earth, a post-apocalyptic water covered wasteland. Explore, learn, and do your best to survive. Hope you like the ocean...

## About the game

Subductus is Multi-User Dungeon, or MUD. The game is entirely text-based, and instructions are written out in simple-sentence form. Think Zork or Collosal Cave Adventure, not Nethack and Rogue. Every user runs a client, and then connects to a Subductus server to play with others. The game runs in semi-realtime, meaning there are turns, but they take place at regular intervals whether you've sent an action or not. Turns are spaced to give you time to type, but also to force action and instill urgency in dangerous scenarios.

## Technical details

The client is written in Python, the server in Ruby. For now the client is pretty much just a wrapper around raw sockets with a touch of string parsing, but it may eventually track login credentials and tunnel traffic through SSL.

## Dependencies

To run the Subductus client you will need:

1. Python3
2. An Internet connection

To run the Subductus server you will need:

1. Ruby2+ (And preferably JRuby for performance reasons)
2. Assorted libraries I'll list later
