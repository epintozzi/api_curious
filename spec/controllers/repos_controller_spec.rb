require 'rails_helper'

RSpec.describe ReposController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      user = create(:user)
      binding.pry
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end