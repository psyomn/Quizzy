require_relative 'answer_tdg.rb'
require_relative 'answer.rb'

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
    rs = AnswerTDG.find(id)
    Answer.new(rs[0],rs[1])
  end 

  def self.find_all
    ret = Array.new
    rs_arr = AnswerTDG.find_all

    rs_arr.each do |rs|
      ret.push Answer.new(rs[0],rs[1])
    end 

    ret
  end 

end 

