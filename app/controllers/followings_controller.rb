class FollowingsController < ApplicationController
  def create
    follower = User.find(params[:follower])
    followed = User.find(params[:followed])

    following = Following.new(follower_id: follower.id, followed_id: followed.id)

    if following.save
      redirect_to followed, notice: "You're now following @#{followed.username}"
    else
      redirect_back notice: "It's too late to follow someone, go get some sleep."
    end
  end

  def destroy
    followed = User.find(params[:followed_id])
    following = Following.find_by(follower_id: current_user.id,
                                  followed_id: followed.id)
    following.destroy
    redirect_to followed, notice: "You stopped following @#{followed.username}"
  end
end
