require 'rails_helper'

describe "a user can see list of starred repos" do
  scenario "user sees list of their starred repos", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stars_path

      expect(page).to have_content "pyro2927/City-Review"
  end
end
