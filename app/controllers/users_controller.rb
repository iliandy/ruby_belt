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

  def dashboard
    @user = current_user
    all_bought_shoe_ids = Buy.pluck(:shoe_id)

    @unsold_shoes = @user.shoes.where.not(id: all_bought_shoe_ids)
    @sold_shoes = @user.shoes.where(id: all_bought_shoe_ids)
    @shoes_bought = @user.shoes_bought
    # render "dashboard.html.erb"
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
