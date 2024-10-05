require 'rails_helper'

RSpec.describe JournalsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { title: "Test Journal", content: "This is a test." } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Journal" do
      expect {
        post :create, params: { journal: valid_attributes }
      }.to change(Journal, :count).by(1)
    end
  end
end
