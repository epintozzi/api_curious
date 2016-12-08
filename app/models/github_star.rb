class GithubStar
  attr_reader :full_name, :full_name, :description, :language, :updated_at

  def initialize(attributes = {})
    @full_name = attributes[:full_name]
    @language = attributes[:language]
    @description = attributes[:description]
    @updated_at = attributes[:updated_at]
  end

  def self.for_user(user)
    GithubService.new.starred(user).map do |raw_repo|
      GithubStar.new(raw_repo)
    end
  end

  def date_format(date_string)
    date = date_string.to_datetime
    date.strftime("%b %e")
  end

end
