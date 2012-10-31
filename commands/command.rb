
# the command that all the subclasses inherit.
# author:: Simon Symeonidis 
class Command

  attr_accessor :params 

  def initialize(params)
    @params = params  
  end 

  def execute
    raise NotImplementedException
  end 

end 
