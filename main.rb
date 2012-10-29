require_relative 'command_line_interface.rb'
require_relative 'table_manager.rb'

# This line should always run before the application
TableManager.run

# Application code after this line 

cli = CommandLineInterface.new 
cli.run

