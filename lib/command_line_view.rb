# class CommandLineView
#   def initialize(output=STDOUT)
#     @output = output
#   end

#   def welcome_message
#     @output.print "Welcome!\n"
#   end

#   def instruction_message
#     @output.print "Enter anything or exit to finish:\n"
#   end

#   def prints_user_input(input=STDIN)
#     puts @user_input
#   end

#   def goodbye_message
#     @output.print "Goodbye!\n"
#   end
# end





class CommandLineView
  def initialize(output=STDOUT)
    @output = output
  end

  def welcome_message
    @output.print "Welcome!\n"
  end

  def instruction_message
    @output.print "Enter anything or exit to finish:\n"
  end

  def echo_user_line(line)
    @output.puts line
  end

  def goodbye_message
    @output.print "Goodbye!\n"
  end
end
