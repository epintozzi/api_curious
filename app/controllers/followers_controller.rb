class FollowersController < ApplicationController

  def index
    user = User.find(current_user.id)
    @followers = GithubFollower.for_user(user)
  end

end
