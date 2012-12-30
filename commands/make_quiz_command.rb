require_relative 'command.rb'
require_relative '../question_mapper.rb'
require_relative '../answer_mapper.rb'

class MakeQuizCommand < Command
   
  # No params needed (maybe in the future
  # limit the number of questions returned)
  def initialize(params)
    super(params)
  end 

  # Execute: print the quiz
  def execute
    questions   = QuestionMapper.find_all
    answers     = AnswerMapper.find_all
    answer_hash = Hash.new(0)

    answers.each do |ans| 
      answer_hash[ans.id] = ans
    end 
  
    questions.each do |question| 
      answer_arr = [] 
      answer_arr << question
      answer_arr << (answers.sample(3) - [answer_hash[question.id]] + [answer_hash[question.id]])
      print_segment(answer_arr)
    end 

    :ok
  end 

private 
  
  # Accept a datastructure in the form of
  # [Question, [Answer, Answer, Answer, ...]]
  def print_segment(params)
    puts params[0]
    params[1].each do |answer|
      puts " * #{answer}"
    end
    puts ""
  end

end 
