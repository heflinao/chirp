class HomePage
  include Capybara::DSL

  def create_tweet(text)
    fill_in "tweet_body", with: text
    find('input[type="submit"]').click
  end
end
