class PokesController < ApplicationController
  before_action :user_authorized, only: [:index]

  def index
    @current_user = current_user()

    # render "index.html.erb"
  end
end
