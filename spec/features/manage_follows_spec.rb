require 'spec_helper'
require_relative '../support/pages/home_page'
require_relative '../support/pages/login_page'
require_relative '../support/factories/user'
require_relative '../support/factories/follow'

describe "manage follows", type: :feature, js: true do
  let!(:login_page) { LoginPage.new }
  let!(:home_page) { HomePage.new }

  let!(:current_user) { FactoryGirl.create(:user) }
  let!(:followed_user) { FactoryGirl.create(:user) }
  let!(:unfollowed_user) { FactoryGirl.create(:user) }

  let!(:follow) { FactoryGirl.create(:follow, { follower: current_user, followed: followed_user }) }

  before(:each) do
    login_page.visit_page
    login_page.log_in(current_user.username, "password10")
  end

  context "following a user" do
    it "displays associated tweets" do
      home_page.toggle_follow(unfollowed_user.id)
      expect(page).to have_content("#{unfollowed_user.username} has been followed!")
    end
  end

  context "unfollow a user" do
    it "removes tweets from feed" do
      home_page.toggle_follow(followed_user.id)
      expect(page).to have_content("#{followed_user.username} has been unfollowed!")
    end
  end
end
