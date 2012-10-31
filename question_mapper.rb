require_relative 'question_tdg.rb'
require_relative 'question.rb'

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
    rs = QuestionTDG.find(id)
    Question.new(rs[0],rs[1],rs[2])
  end 

  def self.find_all
    ret = Array.new
    rs_arr = QuestionTDG.find_all

    rs_arr.each do |rs|
      ret.push Question.new(rs[0],rs[1],rs[2])
    end

    ret
  end 

end 
