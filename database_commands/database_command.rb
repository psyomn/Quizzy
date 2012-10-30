# To be inherited for similar behavior
#Author::Simon Symeonidis 
class DatabaseCommand 

  attr_accessor :params 

  # Initialize the commands parameters 
  def initialize(params)
    @params = params 
  end 

  # Execute the command
  def execute
  end 

end 
