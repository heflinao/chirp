class HomePage
  include Capybara::DSL

  def create_tweet(text)
    fill_in "tweet_body", with: text
    find('input[type="submit"]').click
  end

  def destroy_tweet(tweet_id)
    within(".tweet-#{tweet_id}") do
      find('.delete').click
    end
  end
end
