class UsersController < ApplicationController

  def show
    @all_commits = GithubService.new.all_commits_by_user("#{current_user.username}")
    # @push_events = user_commits.first.has_value?("PushEvent")
  end

end
