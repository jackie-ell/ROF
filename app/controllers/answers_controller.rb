class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:create, :update]
  before_action :find_answer, only: [:destroy]
  before_action :authorize_user!, except: [:show]

  # These actions will not have seperate views
  # def new
  #   @answer = Answer.new
  # end

  # def edit
  # end

  def update
    if @answer.update answer_params
      redirect_to @answer.question
    else
      redirect_to @answer.question, alert: @answer.errors.full_messages.join(', ')
    end
  end

  def create
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user

    def @answer.save
      redirect_to @question
    else
      render :new, alert: @answer.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @answer.destroy
      redirect_to @answer.question
    else
      redirect_to @answer.question, notice: @answer.errors.full_messages.join(', ')
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:answer_id])
  end

  def authorize_user!
    unless can?[:manage, @answer]
      redirect_to root_path, alert: 'Access denied.'

      head :unauthorized
    end
  end
end
