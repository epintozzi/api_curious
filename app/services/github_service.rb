class GithubService

  def repo_by_user(username)

    response = Faraday.get("https://api.github.com/users/#{username}/repos?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")

    repo_data = JSON.parse(response.body, symbolize_names: true)

    repos = repo_data.first
    # repos = repo_data.map do |repo|
    #   repo_data
    # end

  end

end
