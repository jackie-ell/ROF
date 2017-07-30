class DrillGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill_group, only: [:create, :destroy, :update]
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
     redirect_to drill_groups_path, notice: 'drill_group created!'
   end
  end

  def destroy
  end

  def show
    @questions = Question.where(drill_group_id: params[:id])

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

end
