require_relative 'command_line_view'
require_relative 'user_echo_input'

class UserEchoServer
  EXIT = "exit"

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
    @command_line_view = CommandLineView.new(@output)
    @user_echo_input = UserEchoInput.new(@input)
  end

  def start
    @command_line_view.welcome_message
    @command_line_view.instruction_message
    @user_echo_input.read_line
    while exit_entered? == false
      @command_line_view.echo_user_line
      @user_echo_input.read_line
    end
    @command_line_view.goodbye_message
  end

  private

  def exit_entered?
    @user_input == EXIT
  end

  def readline
    @input.readline.chomp
  rescue EOFError
    EXIT
  end
end


  # def start
  #   @command_line_view.welcome_message
  #   @command_line_view.instruction_message
  #   @user_input = readline
  #   while exit_entered? == true
  #     @command_line_view.goodbye_message
  #   end
  #   @output.puts @user_input
  #   @user_input = readline
  # end
