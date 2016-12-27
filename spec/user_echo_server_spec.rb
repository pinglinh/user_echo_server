require_relative '../lib/user_echo_server'
require_relative '../lib/command_line_view'
require_relative '../lib/user_echo_input'
require 'spec_helper'
require "stringio"

describe UserEchoServer do
  it 'prints out the welcome message' do
    output = StringIO.new
    view = CommandLineView.new(output)
    message = view.welcome_message
    expect(output.string).to eq("Welcome!\n")
  end

  it 'prints out the instruction message' do
    output = StringIO.new("")
    view = CommandLineView.new(output)
    message = view.instruction_message
    expect(output.string).to eq("Enter anything or exit to finish:\n")
  end

  it 'prints out the goodbye message' do
    output = StringIO.new("")
    view = CommandLineView.new(output)
    message = view.goodbye_message
    expect(output.string).to eq("Goodbye!\n")
  end

  it 'prints out users input with a new line' do
    output = StringIO.new("")
    view = CommandLineView.new(output)
    user_views = view.echo_user_line("hello")
    expect(output.string).to eq("hello\n")
  end

  it 'takes users input' do
    input = StringIO.new("hello\n")
    user_echo_input = UserEchoInput.new(input)
    line = user_echo_input.read_line
    expect(line).to eq("hello")
  end

  # it "echos what the user wrote" do
  #   input = StringIO.new("one\ntwo\nthree\n")
  #   output = StringIO.new("")
  #   server = UserEchoServer.new(input, output)
  #   server.start
  #   expect(output.string).to eq(
  #     "Welcome!\n"+
  #     "Enter anything or exit to finish:\n"+
  #     "one\n"+
  #     "two\n"+
  #     "three\n"+
  #     "Goodbye!\n"
  #   )
  # end

  # it "ends the server when user enters exit" do
  #     input = StringIO.new("one\ntwo\nexit\nfour\n")
  #     output = StringIO.new("")
  #     server = UserEchoServer.new(input, output)
  #     server.echo_server_start
  #     expect(output.string).to eq(
  #       "Welcome!\n"+
  #       "Enter anything or exit to finish:\n"+
  #       "one\n"+
  #       "two\n"+
  #       "Goodbye!\n"
  #     )
  # end
end
