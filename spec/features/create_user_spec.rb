require 'spec_helper'
require_relative '../support/pages/new_user_page'

describe "creating a new user", type: :feature do
  let(:new_user_page) { NewUserPage.new }

  context "with valid credentials" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("bob", "password10", "password10")
      expect(page).to have_content("Welcome, bob!")
    end
  end

  context "with blank username" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("", "password", "password")
      expect(page).to have_content("User could not be created.")
      expect(page).to have_content("Can't be blank")
    end
  end

  context "with mismatching passwords" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("bob", "password", "")
      expect(page).to have_content("User could not be created.")
      expect(page).to have_content("Doesn't match password")
    end
  end
end
