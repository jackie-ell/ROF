class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill_group, only: [:create, :index]
  before_action :find_question, only: [:update, :destroy]
  before_action :authorize_user!, except: [:index, :show]

  def index
  end

  def new
    @question = Question.new
  end

  def create 
    @question = Question.new question_params
    @question.drill_group = @drill_group
    @question.user = current_user

    if @question.save
      redirect_to @question
    else
      render :new, alert: @question.errors.full_messages.join(', ')
    end
  end

  def show
  
    @question = Question.find params[:id]
    @users_question = UsersQuestion.find_by(user: current_user, question: @question)

  end

  def edit
  end

  def update
    if @question.update question_params
      redirect_to @question
    else
      render :edit, alert: @question.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @question.destroy
      redirect_to @question.drill_group
    else
      redirect_to @question, alert: @question.errors.full_messages.join(', ')
    end
  end

  private
  def question_params
    params.require(:question).permit(:description, :points, :title)
  end

  def find_drill_group
    @drill_group = DrillGroup.find(params[:drill_group_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def authorize_user!
    unless can?(:manage, @question)
      redirect_to root_path, alert: 'Unauthorized access.'

      head :unauthorized
    end
  end
end
