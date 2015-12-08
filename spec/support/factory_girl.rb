require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation
  config.include FactoryGirl::Syntax::Methods

  config.after(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
