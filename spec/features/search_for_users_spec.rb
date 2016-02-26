require 'spec_helper'

describe "searching for a user" do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }
  let(:user) { FactoryGirl.create(:user) }
  let!(:searchable_user) { FactoryGirl.create(:user) }

  before do
    login_page.visit_page
    login_page.log_in(user.username, "password10")
  end

  context "that exists" do
    it "displays a list of matching users" do
      home_page.search_for_user(searchable_user.username)
      expect(home_page.user_list).to have_content(searchable_user.username)
    end
  end

  context "that does not exist" do
    it "displays a failure message" do
      home_page.search_for_user("bob")
      expect(home_page.to_have_no_user_message)
    end
  end
end
