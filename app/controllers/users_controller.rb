class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @opinion = current_user.opinions.build
    @relevant_opinions = current_user.relevant_opinions
    @relevant_mentions = current_user.relevant_mentions
  end

  def show
    @user = User.find(params[:id])
    @relevant_opinions = @user.relevant_opinions(from: :show, max: 20)
    @followers = @user.followers.limit(3)
    @followeds_ids = current_user.followeds.pluck(:id) << current_user.id
  end
end
