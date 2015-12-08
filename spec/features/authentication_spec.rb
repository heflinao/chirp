require 'spec_helper'
require_relative '../support/pages/login_page'
require_relative '../support/factories/user'

describe "logging in", type: :feature, js: true do
  let!(:login_page) { LoginPage.new }
  let!(:user) { FactoryGirl.create(:user)}

  context "with valid credentials" do
    it "sets a current_user" do
      login_page.visit_page
      login_page.log_in(user.username, "password10")
      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content(user.username)
    end
  end

  context "with invalid credentials" do
    it "redirects to the login page" do
      login_page.visit_page
      login_page.log_in(user.username, "")
      expect(page).to have_content("Incorrect username or password.")
      expect(page).to have_content("Login")
    end
  end
end

describe "logging out", type: :feature,js: true do
  let!(:login_page) { LoginPage.new }
  let!(:user) { FactoryGirl.create(:user)}

  before do
    login_page.visit_page
    login_page.log_in(user.username, "password10")
  end

  it "redirects to login page" do
    login_page.logout
    expect(current_path).to eq("/login")
    expect(page).to have_content("Login")
  end
end