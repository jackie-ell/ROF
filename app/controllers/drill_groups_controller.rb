class DrillGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill_group, only: [:destroy, :update]
  before_action :authorize_user!, only: [:new, :create, :destroy, :update]

  def index
   @drillGroups = DrillGroup.all
  end

  def new
  	@drillGroups = DrillGroup.new
  end

  def create

    @drill_group = params.require(:drill_group).permit(:category,  :description, :difficulty)
   if  DrillGroup.create(@drill_group)
       drillgroup_id = DrillGroup.last.id
       redirect_to new_drill_group_question_path(drillgroup_id), notice: 'drill_group created!'
   end
  end

  def destroy
  end

  def show
    @questions = Question.where(drill_group_id: params[:id])
    @drillgroup = DrillGroup.find params[:id]

    @logocat = (@drillgroup.category).to_s.split.first

  end


  private
  def find_drill_group
    @drill_group = DrillGroup.find(id: params[:drill_group_id])
  end

  def authorize_user!
    unless can?(:manage, @drillgroup)
      redirect_to root_path, alert: 'Access denied!'

      head :unauthorized
    end
  end


  def percent_complete(dg, user)
    uq = UsersQuestion.where(user: user)
    correct = uq.where(user: user, is_correct: true, question: dg.questions).count

    # return Correct answers / Total questions
    return ((correct.to_f / dg.questions.count)*100).round(1)
  end
  helper_method :percent_complete
end
