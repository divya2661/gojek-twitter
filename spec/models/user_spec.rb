require 'rails_helper'

RSpec.describe User, type: :model do

  context "field should be present for validity of object" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "length validations" do

    before(:each) do
      @user = User.new(name: "user", email: "email@go-jek.com", password: "password", password_confirmation: "password")
    end

    context "when length of name is more than 100 chars" do
      it "should be invalid" do
        @user.name = 'a'*101
        expect(@user.valid?).not_to be true
      end
    end

    context "when length of name is more than 100 chars" do
      it "should be invalid" do
        @user.email = 's'*101
        expect(@user.valid?).not_to be true
      end
    end

    context "email validation" do
      it "non-gojek email addresses should be invalid" do
        @user.email = 'abcxyz@gmail.com'
        expect(@user.valid?).not_to be true
      end
      it "gojek email address should be valid" do
        @user.email = "divya.n@go-jek.com"
        expect(@user.valid?).to be true
      end
    end

    context "password length validations" do
      it "should be valid when password is more than 7 characters" do
        expect(@user.valid?).to be true
      end
      it "should be invalid when password is less than 7 characters" do
        @user.password = 'a' * 6
        @user.password_confirmation = 'a' * 6
        expect(@user.valid?).to be false
      end
    end

  end

end
