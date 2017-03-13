require './config/environment'
require './app/models/question'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    clue = JAPI::Trebek.random.first
    current_question = Question.create({question:clue.question, answer:clue.answer, clue_id:clue.clue_id, category: clue.category.title})
    @id = current_question.id
    @category = current_question.category
    @question = current_question.question
    erb :index
  end

  post '/check-answer' do
    puts params
    current_question = Question.find(params['id'])
    if current_question.answer == params['response']
      @determination = "Correct"
    else
      @determination = "Wrong"
    end

    erb :answer
  end

end
