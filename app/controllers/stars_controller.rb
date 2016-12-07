class StarsController < ApplicationController

  def index
    user = User.find(current_user.id)
    @starred_repos = GithubService.new.starred(user)
  end

end
