class UsersQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:create]

  def create
    @users_question = UsersQuestion.new
    @users_question.user = current_user
    @users_question.question = @question
    @users_question.num_attempts = 1
    @users_question.last_answer = params[:body]

    # Check for correct answer
    if @users_question.question.answers.find_by(body: @users_question.last_answer)
      @users_question.is_correct = true
    else
      @users_question.is_correct = false
    end

    if @users_question.save
      redirect_to @question
    else
      redirect_to @question, alert: @users_question.errors.full_messages.join(', ')
    end

  end

  def update
    
  end

  private
  def users_questions_params
    params.require(:users_question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end
