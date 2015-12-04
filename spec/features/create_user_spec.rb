require 'spec_helper'
require_relative '../support/pages/new_user_page'

describe "creating a new user", type: :feature do
  let(:new_user_page) { NewUserPage.new }

  context "with valid credentials" do
    it "creates a user", js: true do
      new_user_page.visit_page
      new_user_page.create_user
      expect(page).to have_content("Welcome, bob!")
    end
  end
end
