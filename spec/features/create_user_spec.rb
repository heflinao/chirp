require 'spec_helper'

describe "creating a new user", type: :feature do
  let(:new_user_page) { NewUserPage.new }

  context "with valid credentials" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("bob", "password10", "password10")
      expect(page).to have_content("Welcome, bob!")
      expect(current_path).to include("/users/")
    end
  end

  context "with blank username" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("", "password", "password")
      expect(page).to have_content("User could not be created.")
      expect(page).to have_content("Can't be blank")
      expect(current_path).to eq("/users")
    end
  end

  context "with mismatching passwords" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user("bob", "password", "")
      expect(page).to have_content("User could not be created.")
      expect(page).to have_content("Doesn't match password")
      expect(current_path).to eq("/users")
    end
  end
end
