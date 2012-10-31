require_relative 'command.rb'

# Objects
require_relative '../question.rb'
require_relative '../answer.rb'
require_relative '../question_mapper.rb'
require_relative '../answer_mapper.rb'

class InsertQuestionCommand < Command 

   # params should be an arr of the form 
   # ["question?", "answer"]
   def initialize(params)
     super(params)
   end 

   # Execute the insertion
   def execute
     question = @params[0]
     answer   = @params[1] 

     a = Answer.new(nil,answer)
     q = Question.new(nil,question,nil)
     AnswerMapper.insert(a)
     q.correct_answer_id = a.id
     QuestionMapper.insert(q)

     :ok
   end

end 
