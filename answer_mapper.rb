require_relative 'answer_tdg.rb'

#Author::Simon Symeonidis
class AnswerMapper

  def self.insert(answer)
    id = AnswerTDG
      .insert(answer.text)
    id.flatten! 
    answer.id = id[0]
  end 

  def self.update(answer)
    AnswerTDG
      .update(answer.id\
      ,answer.text)
  end 

  def self.delete(answer)
    AnswerTDG
      .delete(answer.id)
  end 

  def self.find(id)
    AnswerTDG
      .find(id)
  end 

  def self.find_all
    AnswerTDG
      .find_all
  end 

end 

