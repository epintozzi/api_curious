require 'rails_helper'

describe GithubCommit do
  context ".for__user(user)" do
    it "returns commit for a user", :vcr do
        user = User.new(username: "epintozzi", token: ENV["github_user_token"])
        user_commits = GithubCommit.for_user(user.username)
        commit = user_commits.first

        expect(user_commits).to be_an(Array)
        expect(commit).to be_a(GithubCommit)
        expect(commit).to respond_to(:repo)
        expect(commit).to respond_to(:repo_name)
        expect(commit).to respond_to(:payload)
        expect(commit).to respond_to(:message_hash)
    end
  end

  context "#get_commit_message" do
    it "returns commit messages for push event", :vcr do
      user = User.new(username: "epintozzi", token: ENV["github_user_token"])
      user_commits = GithubCommit.for_user(user.username)
      commits = user_commits
      messages = GithubCommit.get_commit_message(commits)

      expect(messages).to be_an(Array)
    end
  end
end
