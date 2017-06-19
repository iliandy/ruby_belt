class BuysController < ApplicationController
  before_action :user_authorized, only: [:create]

  def create
    Buy.create(user: current_user, shoe: Shoe.find(params[:shoe_id]))
    redirect_to "/dashboard/#{current_user.id}"
  end

  

end
