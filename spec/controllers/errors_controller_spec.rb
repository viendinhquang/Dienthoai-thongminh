require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #not_found" do
    it "returns http success" do
      get :not_found
      expect(response).to have_http_status(:success)
    end
  end

end
