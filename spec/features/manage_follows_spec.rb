require 'spec_helper'

describe "manage follows", type: :feature, js: true do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }

  let(:current_user) { FactoryGirl.create(:user) }
  let!(:followed_user) { FactoryGirl.create(:user) }
  let!(:unfollowed_user) { FactoryGirl.create(:user) }

  let!(:follow) { FactoryGirl.create(:follow, { follower: current_user, followed: followed_user }) }

  let!(:followed_user_tweet) { FactoryGirl.create(:tweet, { user: followed_user }) }
  let!(:unfollowed_user_tweet) { FactoryGirl.create(:tweet, { user: unfollowed_user }) }

  before(:each) do
    login_page.visit_page
    login_page.log_in(current_user.username, "password10")
  end

  context "following a user" do
    it "displays a sucess message" do
      home_page.toggle_follow(unfollowed_user.id)
      expect(page).to have_content("#{unfollowed_user.username} has been followed!")
    end

    it "displays associated tweets in feed" do
      home_page.toggle_follow(unfollowed_user.id)
      expect(page).to have_content(unfollowed_user_tweet.body)
    end
  end

  context "unfollow a user" do
    it "displays a sucess message" do
      home_page.toggle_follow(followed_user.id)
      expect(page).to have_content("#{followed_user.username} has been unfollowed!")
    end

    it "removes tweets from feed" do
      home_page.toggle_follow(followed_user.id)
      expect(page).to_not have_content(followed_user_tweet.body)
    end
  end
end
