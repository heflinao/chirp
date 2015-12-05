RSpec.configure do |config|
  config.before(:suite) do
    Capybara.run_server = true
    Capybara.javascript_driver = :selenium
  end
end
