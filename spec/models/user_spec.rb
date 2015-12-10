require 'spec_helper'

describe User do
  context "with followers" do
    it "responds to .followers" do
      user = User.create(username: "user", password: "password")
      user.save
      follower = User.create(username: "follower", password: "password")
      follower.save
      Follow.create(followed: user, follower: follower)
      expect(user.followers).to include(follower)
    end
  end

  context "who follows" do
    it "responds to .following" do
      user = User.create(username: "user", password: "password")
      user.save
      followed = User.create(username: "followed", password: "password")
      followed.save
      Follow.create(followed: followed, follower: user)
      expect(user.following).to include(followed)
    end
  end
end
