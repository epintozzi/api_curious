require 'rails_helper'

describe "GithubService" do

  context "#all_commits_by_user" do
    it "returns a user's commits", :vcr do
      user_commits = GithubService.new.all_commits_by_user("epintozzi")

      push_events = user_commits.first.has_value?("PushEvent")

      expect(push_events).to eq(true)
    end
  end

  # context "#commits_by_user_repo" do
  #   it "returns a user's commits by repo", :vcr do
  #     user_commits_by_repo = GithubService.new.commits_by_user_repo("epintozzi")
  #
  #     expect(user_commits_by_repo).to have_key(:sha)
  #   end
  # end

  context "#commit_details_by_repo_url" do
    it "returns a user's commit by repo url", :vcr do
      user_commits_by_repo_url = GithubService.new.commit_details_by_repo_url("https://api.github.com/repos/epintozzi/rales_engine/commits/85c1562f955b843c26b9e4210064a7baede9c1fa")

      message = user_commits_by_repo_url[:commit][:message]

      expect(message).to eq("Merge pull request #3 from epintozzi/erin\n\nflawless git workflow")
    end
  end

  context "#user_repos" do
    it "returns all repositories for a user", :vcr do
      user = User.new(token: ENV["github_user_token"])
      user_repos = GithubService.new.user_repos(user)
      repo = user_repos.first

      expect(user_repos).to be_an(Array)
      expect(repo).to have_key(:full_name)
      expect(repo).to have_key(:name)
      expect(repo).to have_key(:description)
    end
  end

  context "#starred" do
    it "returns all starred repositories for a user", :vcr do
      user = User.new(token: ENV["github_user_token"])
      starred_repos = GithubService.new.starred(user)
      repo = starred_repos.first

      expect(starred_repos).to be_an(Array)
      expect(repo).to have_key(:full_name)
      expect(repo).to have_key(:name)
      expect(repo).to have_key(:description)
    end
  end

  context "#followers" do
    it "returns all a user's followers", :vcr do
      user = User.new(token: ENV["github_user_token"])
      followers = GithubService.new.followers(user)
      follower = followers.first

      expect(followers).to be_an(Array)
      expect(follower).to have_key(:login)
    end
  end

  context "#following" do
    it "returns all followers of a user", :vcr do
      user = User.new(token: ENV["github_user_token"])
      following = GithubService.new.following(user)
      follower = following.first

      expect(following).to be_an(Array)
      expect(follower).to have_key(:login)
    end
  end

  context "#orgs" do
    it "returns all of a user's organizations", :vcr do
      user = User.new(token: ENV["github_user_token"])
      orgs = GithubService.new.orgs(user)
      org = orgs.first

      expect(orgs).to be_an(Array)
      expect(org).to have_key(:login)
    end
  end
end
