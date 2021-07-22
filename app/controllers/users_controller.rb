class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @opinion = current_user.opinions.build
    @relevant_opinions = current_user.relevant_opinions
  end

  def show
    @user = User.find(params[:id])
    @relevant_opinions = @user.relevant_opinions(from: :show, max: 20)
  end
end
