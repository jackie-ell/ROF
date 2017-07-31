class UsersController < ApplicationController

  def index
    @users = User.order(:username)
  end

  def new
    @user = User.new
  end

  def leaderboard
    @users = User.order(total_pts: :desc).limit(10)
    @rank = 0
  end

  def show
    @user = User.find(params[:id])
    @users_question = UsersQuestion.where(user: @user)
  end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.registration_pending_email(@user).deliver_now
      flash[:notice] = 'User Successfully Created'
      session[:user_id] = @user.id
      redirect_to drill_groups_path
    else
      flash[:alert] = "User fields not valid. Please fix and resubmit."
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
