class UserEcho
  def initialize(view)
    @view = view
  end

  def start
    @view.print_welcome_message
    @view.print_instruction_message
    echo_input
  end

 private

  def echo_input
    @user_input = STDIN.readline.chomp
    while !exit_entered?
      @view.print_user_input(@user_input)
      @user_input = STDIN.readline.chomp
    end
    @view.print_goodbye_message
  end

  def exit_entered?
    @user_input == "exit"
  end
end

class View
  def print_welcome_message
    print "Welcome!\n"
  end

  def print_instruction_message
    print "Please enter a word to be reprinted, to exit this program please enter exit:\n"
  end

  def print_goodbye_message
    print "Goodbye!\n"
  end

  def print_user_input(user_input)
    print user_input + "\n"
  end
end


# user_view = View.new
# user_echo = UserEcho.new(user_view)
# user_echo.start
