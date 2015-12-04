class NewUserPage
  include Capybara::DSL

  def visit_page
    visit "/"
    self
  end

  def create_user
    fill_in "user_username", with: "bob"
    fill_in "user_password", with: "password10"
    fill_in "user_password_confirmation", with: "password10"
    find('input[type="submit"]').click  
  end
end
