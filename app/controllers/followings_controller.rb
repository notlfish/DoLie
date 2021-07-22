class FollowingsController < ApplicationController
  def create
    follower = User.find(params[:follower])
    followed = User.find(params[:followed])

    following = Following.new(follower_id: follower.id, followed_id: followed.id)

    if following.save
      redirect_to followed, notice: "You're now following @#{followed.username}"
    else
      render :back, notice: "It's too late to follow someone, get some sleep."
    end
  end
end
