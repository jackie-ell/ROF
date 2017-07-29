class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to questions_user_question_path, notice: 'Successfully signed in.'
    else
      render :new, alert: 'Incorrect email or password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
