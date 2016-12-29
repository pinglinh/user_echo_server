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

  it 'prints out users input with a new line - 1 word' do
    output = StringIO.new("")
    view = CommandLineView.new(output)
    user_views = view.echo_user_line("hello")
    expect(output.string).to eq("hello\n")
  end

  it 'prints out users input with a new line - 2 words' do
    output = StringIO.new("")
    view = CommandLineView.new(output)
    user_views = view.echo_user_line("hello linh")
    expect(output.string).to eq("hello linh\n")
  end

  it 'takes users input - 1 word' do
    input = StringIO.new("hello\n")
    user_echo_input = UserEchoInput.new(input)
    line = user_echo_input.read_line
    expect(line).to eq("hello")
  end

  it 'takes users input - 2 words' do
    input = StringIO.new("hello linh\n")
    user_echo_input = UserEchoInput.new(input)
    line = user_echo_input.read_line
    expect(line).to eq("hello linh")
  end

  it "echos what the user wrote" do
    input = StringIO.new("one\ntwo\nthree\n")
    output = StringIO.new("")
    server = UserEchoServer.new(input, output)
    server.start
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
    server.start
    expect(output.string).to eq(
      "Welcome!\n"+
      "Enter anything or exit to finish:\n"+
      "one\n"+
      "two\n"+
      "Goodbye!\n"
    )
  end

  it 'rescues EOF' do
    input = StringIO.new("")
    output = StringIO.new("")
    server = UserEchoServer.new(input, output)
    server.start
    expect(output.string).to eq(
      "Welcome!\n"+
      "Enter anything or exit to finish:\n"+
      "Goodbye!\n"
    )
  end
end
