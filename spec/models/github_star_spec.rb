require 'rails_helper'

describe GithubStar do
  context ".for_user(user)" do
    it "returns starred repos for a user", :vcr do
        user = User.new(token: ENV["github_user_token"])
        starred_repos = GithubStar.for_user(user)
        repo = starred_repos.first

        expect(starred_repos).to be_an(Array)
        expect(repo).to be_a(GithubStar)
        expect(repo).to respond_to(:full_name)
        expect(repo).to respond_to(:language)
        expect(repo).to respond_to(:description)
        expect(repo).to respond_to(:updated_at)
    end
  end

  context "date_format(date_string)" do
    it "returns formatted date", :vcr do
        user = User.new(token: ENV["github_user_token"])
        starred_repos = GithubStar.for_user(user)
        repo = starred_repos.first
        date = repo.date_format(repo.updated_at)

        expect(starred_repos).to be_an(Array)
        expect(repo).to be_a(GithubStar)
    end
  end

end
