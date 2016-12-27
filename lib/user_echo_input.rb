class UserEchoInput
  EXIT = "exit"

  def initialize(input=STDIN)
    @input = input
  end

  def read_line
    @input.readline.chomp
  rescue EOFError
    EXIT
  end
end
