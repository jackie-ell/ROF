class DrillGroupsController < ApplicationController
  
  def index
   @drillGroups = DrillGroup.all
  end

  def new
  	@drillGroups = DrillGroup.new 
  end

  def create

  end

  def destroy
  end
end
