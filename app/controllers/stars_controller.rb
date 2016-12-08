class StarsController < ApplicationController

  def index
    user = User.find(current_user.id)
    @starred_repos = GithubStar.for_user(user)
  end

end
