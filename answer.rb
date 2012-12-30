class Answer

  attr_accessor :id 
  attr_accessor :text

  def initialize(id,answer) 
    @id = id 
    @text = answer 
  end 

  def to_s
    @text
  end

end 

