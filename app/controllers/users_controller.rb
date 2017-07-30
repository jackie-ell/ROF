class UsersController < ApplicationController
  def new
    @user = User.new
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
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
