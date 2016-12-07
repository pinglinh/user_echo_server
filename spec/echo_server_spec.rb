require 'echo_server'
require 'spec_helper'
require "stringio"

describe UserEchoServer do
  it "echos what the user wrote" do
    input = StringIO.new("one\ntwo\nthree\n")
    output = StringIO.new("")
    server = UserEchoServer.new(input, output)
    server.echo_server_start
    expect(output.string).to eq(
      "Welcome!\n"+
      "Enter anything or exit to finish:\n"+
      "one\n"+
      "two\n"+
      "three\n"+
      "Goodbye!\n"
    )
  end

  it "ends the server when user enters exit" do
      input = StringIO.new("one\ntwo\nexit\nfour\n")
      output = StringIO.new("")
      server = UserEchoServer.new(input, output)
      server.echo_server_start
      expect(output.string).to eq(
        "Welcome!\n"+
        "Enter anything or exit to finish:\n"+
        "one\n"+
        "two\n"+
        "Goodbye!\n"
      )
  end
end
