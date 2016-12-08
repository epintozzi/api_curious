require 'rails_helper'

describe "a user can see list of people they follow" do
  scenario "user sees list of people they follow", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit following_index_path

      expect(page).to have_content "AliSchlereth"
  end
end
