require 'rails_helper'

describe "GithubService" do
  context "#repo_by_user" do
    it "returns a user's repos" do
      user_repos = GithubService.new.repo_by_user("epintozzi")

      expect(user_repos).to have_key(:name)
    end
  end
end
