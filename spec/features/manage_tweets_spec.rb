require 'spec_helper'
require_relative '../support/pages/home_page'
require_relative '../support/pages/login_page'
require_relative '../support/factories/user'

describe "manage tweets", type: :feature, js: true do
  let!(:login_page) { LoginPage.new }
  let!(:home_page) { HomePage.new }
  let!(:user) { FactoryGirl.create(:user)}
  let(:tweet_body) { "Humid uc coffee emporium music hall city chili midpoint music festival fifty west cincinnati bengals historic architecture paris of america." }
  let(:over_length_tweet_body) { "Humid uc coffee emporium music hall city chili midpoint music festival fifty west cincinnati bengals historic architecture paris of america. Humid uc coffee emporium!" }

  before(:each) do
    login_page.visit_page
    login_page.log_in(user.username, "password10")
  end

  context "creating a new tweet" do
    describe "with valid character count" do
      it "displays a new tweet" do
        home_page.create_tweet(tweet_body)
        expect(page).to have_content("Tweet saved!")
      end
    end

    describe "with an invalid character count" do
      it "displays an error message" do
        home_page.create_tweet(over_length_tweet_body)
        expect(page).to have_content("Is too long (maximum is 140 characters)")
      end
    end
  end
end
