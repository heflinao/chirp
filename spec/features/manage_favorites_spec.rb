require 'spec_helper'

describe "manage favorites", type: :feature, js: true do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }

  let(:current_user) { FactoryGirl.create(:user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:favorited_tweet) { FactoryGirl.create(:tweet, { user: user, body: "Super sweet tweet!" }) }
  let!(:unfavorited_tweet) { FactoryGirl.create(:tweet, { user: user, body: "Awesome tweet!" }) }
  let!(:favorite) { FactoryGirl.create(:favorite, { user: current_user, tweet: favorited_tweet }) }

  before(:each) do
    login_page.visit_page
    login_page.log_in(current_user.username, "password10")
  end

  context "favoriting a tweet" do
    it "displays a sucess message and displays favorited tweets in favorited feed" do
      home_page.visit_user(user.id)
      home_page.favorite_tweet(unfavorited_tweet.id)
      expect(page).to have_content("Tweet has been favorited!")
      expect(page).to have_content(unfavorited_tweet.body)
    end
  end

  context "unfavoriting a tweet" do
    it "displays a sucess message and removes unfavorited tweets in favorited feed" do
      home_page.unfavorite_tweet(favorited_tweet.id)
      expect(page).to have_content("Tweet has been unfavorited!")
      expect(page).to_not have_content(favorited_tweet.body)
    end
  end
end
