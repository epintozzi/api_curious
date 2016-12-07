require 'rails_helper'

describe "GithubService" do
  context "#repos_by_user" do
    it "returns a user's repos" do
      user_repos = GithubService.new.repos_by_user("epintozzi")

      expect(user_repos).to have_key(:name)
    end
  end

  context "#all_commits_by_user" do
    it "returns a user's commits" do
      user_commits = GithubService.new.all_commits_by_user("epintozzi")

      push_events = user_commits.first.has_value?("PushEvent")

      expect(push_events).to eq(true)
    end
  end

  context "#commits_by_user_repo" do
    it "returns a user's commits by repo" do
      user_commits_by_repo = GithubService.new.commits_by_user_repo("epintozzi")

      expect(user_commits_by_repo).to have_key(:sha)
    end
  end

  context "#commit_details_by_repo_url" do
    it "returns a user's commit by repo url" do
      user_commits_by_repo_url = GithubService.new.commit_details_by_repo_url("https://api.github.com/repos/epintozzi/rales_engine/commits/85c1562f955b843c26b9e4210064a7baede9c1fa")

      message = user_commits_by_repo_url[:commit][:message]

      expect(message).to eq("Merge pull request #3 from epintozzi/erin\n\nflawless git workflow")
    end
  end
end
