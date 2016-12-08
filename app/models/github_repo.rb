class GithubRepo
  attr_reader :name, :full_name, :description, :language, :updated_at

  def initialize(attributes = {})
    @name = attributes[:name]
    @language = attributes[:language]
    @description = attributes[:description]
    @updated_at = attributes[:updated_at]
  end

  def self.for_user(user)
    GithubService.new.user_repos(user).map do |raw_repo|
      GithubRepo.new(raw_repo)
    end
  end

  def date_format(date_string)
    date = date_string.to_datetime
    date.strftime("%b %e")
  end

end
