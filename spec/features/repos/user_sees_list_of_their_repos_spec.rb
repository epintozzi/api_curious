require 'rails_helper'

describe "a user can see list of their repos" do
  scenario "user sees list of their repos", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit repos_path

      expect(page).to have_content "api_curious"
  end
end
