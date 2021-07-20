class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinion = current_user.opinions.build
  end

  def show; end
end
