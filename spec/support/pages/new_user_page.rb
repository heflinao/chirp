class NewUserPage
  include Capybara::DSL

  def visit_page
    visit "/"
    self
  end

  def create_user(username, password, password_confirm)
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password_confirm
    find('input[type="submit"]').click
  end
end
