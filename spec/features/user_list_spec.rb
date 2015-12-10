require 'spec_helper'
require_relative '../support/pages/home_page'
require_relative '../support/pages/login_page'
require_relative '../support/factories/user'
require_relative '../support/factories/follow'

describe "user list", type: :feature, js: true do
  let!(:login_page) { LoginPage.new }
  let!(:home_page) { HomePage.new }

  let!(:current_user) { FactoryGirl.create(:user) }
  let!(:user_one) { FactoryGirl.create(:user) }
  let!(:user_two) { FactoryGirl.create(:user) }

  before(:each) do
    login_page.visit_page
    login_page.log_in(current_user.username, "password10")
  end

  it "displays all users except current user" do
    user_count = User.all.count - 1
    expect(home_page.user_count).to eq(user_count)
    expect(home_page).to have_user(user_one.username)
    expect(home_page).to have_user(user_two.username)
  end
end
