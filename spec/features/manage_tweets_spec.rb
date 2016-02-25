require 'spec_helper'

describe "manage tweets", type: :feature, js: true do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomePage.new }

  let(:user) { FactoryGirl.create(:user)}
  let!(:tweet) { FactoryGirl.create(:tweet, { user_id: user.id }) }
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
        expect(home_page.to_have_success)
      end
    end

    describe "with an invalid character count" do
      it "displays an error message" do
        home_page.create_tweet(over_length_tweet_body)
        expect(home_page.to_have_error)
      end
    end
  end

  context "viewing tweet feed" do
    it "displays tweets from current_user and followers" do
      expect(home_page.to_have_tweet_feed)
      expect(home_page.tweet_count).to eq(1)
    end
  end

  context "delete a tweet" do
    it "displays a success message" do
      tweet_feed_count = home_page.tweet_count
      home_page.destroy_tweet(tweet.id)

      expect(home_page.to_have_success)
      expect(home_page.tweet_count).to eq(tweet_feed_count - 1)
    end
  end
end
