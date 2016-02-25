class LoginPage
  include Capybara::DSL

  def visit_page
    visit "/login"
    self
  end

  def log_in(username, password)
    fill_in "username", with: username
    fill_in "password", with: password
    find('input[type="submit"]').click
  end

  def logout
    find_link('Log Out').click
  end

  def to_have_error
    page.find('.alert.alert-danger')
  end

  def to_have_success
    page.find('#flash_success')
  end
end
