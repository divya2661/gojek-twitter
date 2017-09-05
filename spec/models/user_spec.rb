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

  end

end
