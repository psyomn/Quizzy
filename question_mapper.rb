require_relative 'question_tdg.rb'

# Question Mapper to handle the stuff given from QuestionTDG
# Author::Simon Symeonidis 
class QuestionMapper

  def self.insert(question)
    QuestionTDG
      .insert(question.text,question.correct_answer_id)
  end 

  def self.update(question)
    QuestionTDG
      .update(question.id\
      ,question.text\
      ,question.correct_answer_id)
  end 

  def self.delete(question)
    QuestionTDG
      .delete(question.id)
  end 

  def self.find(id)
    QuestionTDG
      .find(id)
  end 

  def self.find_all
    QuestionTDG
      .find_all
  end 

end 
