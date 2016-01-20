require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user, username: "user", password: "password") }
  let(:follower) { FactoryGirl.create(:user, username: "follower", password: "password") }
  let(:followed) { FactoryGirl.create(:user, username: "followed", password: "password") }

  before(:each) do
    FactoryGirl.create(:follow, followed: user, follower: follower)
    FactoryGirl.create(:follow, followed: followed, follower: user)
  end

  context "with followers" do
    it "responds to .followers" do
      expect(user.followers).to include(follower)
    end
  end

  context "who follows" do
    it "responds to .following" do
      expect(user.following).to include(followed)
    end
  end
end
