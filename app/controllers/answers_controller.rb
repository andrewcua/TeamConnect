class AnswersController < ApplicationController

	def create
		question = Question.find(params[:answer][:question_id])
		question.answers.create(answer_params)
		session[:current_user_emaail] = answer_params[:email]
		redirect_to question
	end

	private
	
	def answer_params
		params.require(:answer).permit(:email, :body)
	end

end
