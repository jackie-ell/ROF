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

  def show
    @questions = Question.where(drill_group_id: params[:id])
  end

  def percent_complete(dg, user)
    uq = UsersQuestion.where(user: user)
    correct = uq.where(user: user, is_correct: true, question: dg.questions).count

    # return Correct answers / Total questions
    return ((correct.to_f / dg.questions.count)*100).round(1)
  end
  helper_method :percent_complete
end
