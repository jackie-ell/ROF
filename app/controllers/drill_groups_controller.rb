class DrillGroupsController < ApplicationController
  
  def index
   @drillGroups = DrillGroup.all
  end

  def new
  	@drillGroups = DrillGroup.new 
  end

  def create
    drill_group = params.require(:drill_group).permit(:category,  :description, :difficulty)
   if  DrillGroup.create(drill_group)
     redirect_to drill_groups_path, notice: 'drill_group created!'
   end
  end

  def destroy
  end
end
