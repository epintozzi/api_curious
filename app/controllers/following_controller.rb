class FollowingController < ApplicationController

  def index
    user = User.find(current_user.id)
    @followers = GithubFollowing.for_user(user)
  end

end
