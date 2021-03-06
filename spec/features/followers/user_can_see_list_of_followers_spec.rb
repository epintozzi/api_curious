require 'rails_helper'

describe "a user can see list of followers" do
  scenario "user sees list of their followers", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit followers_path

      expect(page).to have_content "pyro2927"
  end
end
