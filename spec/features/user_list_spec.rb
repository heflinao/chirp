require 'spec_helper'

describe "user list", type: :feature, js: true do
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

  it "displays all users except current user" do
    user_count = User.all.count - 1
    expect(home_page.user_count).to eq(user_count)
    expect(home_page).to have_user(followed_user.username)
    expect(home_page).to have_user(unfollowed_user.username)
  end

  it "displays following status of a user" do
    expect(home_page.followed_user_count).to eq(1)
  end
end
