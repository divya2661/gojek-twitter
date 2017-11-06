require 'rails_helper'

RSpec.describe TweetController, type: :controller do

  let("valid_tweet") {{message: "this is a valid tweet", user_id: 1}}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "When tweet is successful" do
    before {post :create, params: valid_tweet}
    it "should return 200" do
      expect(response).to have_http_status(:success)
    end
  end

end
