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
    it "returns error messages", js: true do
      new_user_page.visit_page
      new_user_page.create_user("", "password", "password")

      expect(new_user_page.to_have_error_on(:username))
      expect(current_path).to eq("/users")
    end
  end

  context "with duplicate username" do
    before(:each) do
      FactoryGirl.create(:user, username: "existing_user", password: "password", password_confirmation: "password")
    end

    it "returns error messages", js: true do
      new_user_page.visit_page
      new_user_page.create_user("existing_user", "password", "password")

      expect(new_user_page.to_have_error_on(:username))
      expect(current_path).to eq("/users")
    end
  end

  context "with mismatching passwords" do
    it "returns error messages", js: true do
      new_user_page.visit_page
      new_user_page.create_user("bob", "password", "")

      expect(new_user_page.to_have_error_on(:password_confirmation))
      expect(current_path).to eq("/users")
    end
  end
end
