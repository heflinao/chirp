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

  def user_count
    within(".user-list") do
      find_all('.user').count
    end
  end

  def has_user?(username)
    within(".user-list") do
      find('.user', text: username)
    end
  end
end
