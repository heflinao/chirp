class HomePage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def create_tweet(text)
    fill_in "tweet_body", with: text
    find('input[type="submit"]').click
  end
end
