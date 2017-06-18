class UsersController < ApplicationController
  before_action :user_logged_in, only: [:new]

  def new
    # render "new.html.erb"
  end

  def create
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id
      redirect_to "/pokes"
    else
      flash[:msgs] = user.errors.full_messages
      redirect_to "/"
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation, :birthdate)
    end
end
