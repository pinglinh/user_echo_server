require 'echo_server'
require 'spec_helper'

describe UserEcho do
	it 'prints welcome message when start method is called' do
		user_view = View.new
		user_echo = UserEcho.new(user_view)
    result = user_echo.start
		expect(result.string).to eq(
      "Welcome!\n"+
      "Please enter a word to be reprinted, to exit this program please enter exit:\n")
		# expect(user_view).to receive(:print_instruction_message)
		# allow(STDIN).to receive(:readline) { 'exit' }



	end
end
