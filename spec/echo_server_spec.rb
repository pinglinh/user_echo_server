require 'echo_server'
require 'spec_helper'

describe UserEcho do
	it 'prints welcome message when start method is called' do
		user_view = double("View")
		user_echo = UserEcho.new(user_view)
		expect(user_view).to receive(:print_welcome_message)
		expect(user_view).to receive(:print_instruction_message)
		allow(STDIN).to receive(:readline) { 'exit' }

		result = user_echo.start

	end	
end