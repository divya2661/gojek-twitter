require 'rails_helper'

RSpec.describe TweetController, type: :controller do

  let("valid_tweet") {{message: "this is a valid tweet", user_id: 1}}
  let("invalid_tweet") {{user_id: 1}}
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "post #create" do
  
    context "When tweet is valid" do
      it "should return 200" do
        post :create, params: valid_tweet
        expect(response).to have_http_status(200)
      end
    end

    context "When tweet is invalid" do
      it "should return 422" do
        post :create, params: invalid_tweet
        expect(response).to have_http_status(422)
      end
    end

  end

end

