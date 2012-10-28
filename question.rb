# The question class. 
# Author::Simon Symeonidis 
class Question

  attr_reader :id 
  attr_accessor :text
  attr_accessor :correct_answer_id

  def initialize(id,text,correct_answer_id)
    @id = id 
    @text = text 
    @correct_answer_id = correct_answer_id
  end 

end 

