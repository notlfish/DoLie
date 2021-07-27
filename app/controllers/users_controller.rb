class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinion = current_user.opinions.build
    @relevant_opinions = current_user.relevant_opinions
  end

  def show; end
end
