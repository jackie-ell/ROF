class UsersQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_users_question, only: [:update]

  def create
    @users_question = UsersQuestion.new
    @users_question.user = current_user
    @users_question.question = @question
    @users_question.num_attempts = 1
    @users_question.last_answer = params[:body]

    # Check for correct answer
    if @users_question.question.answers.find_by(body: @users_question.last_answer)
      @users_question.is_correct = true
      @users_question.user.total_pts += @question.points
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
    @users_question.num_attempts += 1
    @users_question.last_answer = params[:body]

    if @users_question.question.answers.find_by(body: @users_question.last_answer)
      @users_question.is_correct = true
      @users_question.user.total_pts += @question.points
    else
      @users_question.is_correct = false
    end

    if @users_question.save
      redirect_to @question
    else
      redirect_to @question, alert: @users_question.errors.full_messages.join(', ')
    end
  end

  private
  # def users_questions_params
  #   params.require(:users_question).permit(:body)
  # end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_users_question
    @users_question = UsersQuestion.find_by(user: current_user, question: params[:question_id])
  end
end
