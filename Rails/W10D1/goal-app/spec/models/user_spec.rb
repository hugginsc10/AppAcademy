require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create!(email: "anoush@gmail.com", password: "PASSWORD" ) 
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it "ensures a session_token before validation" do  
    if user.valid?
      expect(user.session_token).not_to be_nil
    end
  end 

  describe "#reset_session_token!" do
    it "reassign session token" do
      current_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to be(current_token)
    end
  end
  describe "#password=" do
    it "assign a password digest" do
      expect(user.password_digest).not_to be_nil
    end
    it "reassigns an old password" do
      user.password = "newpassword"
      expect(user.password).to eq("newpassword")
    end
    it "checks password not in database" do
      anush = User.find_by(email: user.email)
      expect(anush.password).to be_nil
      expect(user.password).not_to be_nil
    end

  end
  describe "#is_password?" do
    it "checks if password is valid" do
      expect(user.is_password?("PASSWORD")).to be true
    end

    it "doesn't like an incorrect password" do
      expect(user.is_password?("PASSWORDDDDDDD")).to be false
    end
  end

  describe "::find_by_credentials" do
    it "returns the right user with the given credentials" do  
      expect(User.find_by_credentials(user.email, user.password)).to eq(user)
    end

    it "returns nil if no user" do
      expect(User.find_by_credentials("daddy", "shanaynay")).to be_nil
    end

    it "returns nil if incorrect password" do
      expect(User.find_by_credentials(user.email, "naynaynayany")).not_to eq(user)
    end
  end
    describe "associations" do
      it {should have_many(:goals)}
    end
end 
