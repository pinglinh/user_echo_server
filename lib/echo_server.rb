class UserEchoServer
  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
    @view = View.new(@output)
  end

  def echo_server_start
    @view.welcome_and_instruction_message
    @user_input = @input.readline.chomp
    while exit_entered? == false
      @output.puts @user_input
      @user_input = @input.readline.chomp
    end
    @view.goodbye_message
  end

  def exit_entered?
    @user_input == "exit"
  end
end

class View
  def initialize(output=STDOUT)
    @output = output
  end

  def welcome_and_instruction_message
    @output.print "Welcome!\n"
    @output.print "Enter anything or exit to finish:\n"
  end

  def goodbye_message
    @output.print "Goodbye!\n"
  end
end

# server = UserEchoServer.new
# server.echo_server_start
