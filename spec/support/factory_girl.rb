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

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
