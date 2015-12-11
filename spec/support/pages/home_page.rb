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

  def followed_user_count
    within(".user-list") do
      find_all('.glyphicon.glyphicon-star').count
    end
  end

  def user_list
    find('.user-list')
  end

  def has_user?(username)
    within(".user-list") do
      find('.user', text: username)
    end
  end

  def toggle_follow(user_id)
    within(".user-#{user_id}") do
      find('.toggle-follow').click
    end
  end

  def visit_user(user_id)
    within(".user-#{user_id}") do
      find('.user-link').click
    end
  end

  def favorite_tweet(tweet_id)
    within(".tweet-#{tweet_id}") do
      find('.favorite-button').click
    end
  end

  def unfavorite_tweet(tweet_id)
    within(".favorite-#{tweet_id}") do
      find('.unfavorite-button').click
    end
  end
end
