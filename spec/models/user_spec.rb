require 'rails_helper'

RSpec.describe User, type: :model do

  context "field should be present for validity of object" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
  end

  describe "length validations" do

    before(:each) do
      @user = User.new(name: "user", email: "email")
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

  end

  describe "uniqueness validations" do

    before(:each) do
      @user = User.new(name: "user", email: "email@go-jek.com")
    end

    context "when a new user registers with an existence email" do
      it "should implement uniqueness of email addresses" do
        duplicate_user = @user.dup
        duplicate_user.name = "dup_name"
        @user.save
        expect(duplicate_user.valid?).to be false
      end
    end

  end

end
