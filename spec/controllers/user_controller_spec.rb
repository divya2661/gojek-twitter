require 'rails_helper'

RSpec.describe UserController, type: :request do
  describe "POST /new" do
    let("valid_user") { { name: "anirudh", email: "anirudh.v@go-jek.com" } }
    let("invalid_user") { { name: "asd", email: "ada@gmail.com" } }

    context "when the request is valid" do
      before { post '/user', params: valid_user }
      it "response should be non-empty" do
        expect(JSON.parse(response.body)).not_to be_empty
      end
      it "response code should be 200" do
        expect(JSON.parse(response.code)).to eq 200
      end
    end

    context "when the request is invalid" do
      before { post '/user', params: invalid_user }
      it "response code should be 422" do
        expect(JSON.parse(response.code)).to eq 422
      end
    end
  end
end
