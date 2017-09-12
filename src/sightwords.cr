require "./sightwords/*"
require "kemal"

macro renderer(filename)
  render "src/views/#{{{filename}}}.ecr", "src/views/layouts/layout.ecr"
end

module Sightwords
  # Matches GET "http://host:port/"
  get "/" do
    words = File.read_lines("src/sightwords.txt")

    renderer "index"
  end

  # Creates a WebSocket handler.
  # Matches "ws://host:port/socket"
  #ws "/socket" do |socket|
    #socket.send "Hello from Kemal!"
  #end
end
Kemal.run
