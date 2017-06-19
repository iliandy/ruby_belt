class ShoesController < ApplicationController
  before_action :user_authorized, only: [:index]

  def index
    @user = current_user
    all_bought_shoe_ids = Buy.pluck(:shoe_id)

    @shoes = Shoe.where.not(id: all_bought_shoe_ids)
    # render "index.html.erb"
  end

  def create
    user = current_user
    shoe = Shoe.create(shoe_params.merge(user: user))

    if shoe.valid?
      redirect_to "/shoes"
    else
      flash[:msgs] = shoe.errors.full_messages
      redirect_to "/dashboard/#{user.id}"
    end
  end

  def destroy
    user = current_user
    Shoe.destroy(params[:shoe_id])
    redirect_to "/dashboard/#{user.id}"
  end

  private
    def shoe_params
      params.require(:shoe).permit(:name, :amount)
    end
end
