require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'rspec-html-matchers'
FactoryGirl.find_definitions

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  require 'database_cleaner'
  config.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  config.mock_with :rspec
  config.filter_run focus: true unless ENV['SEMAPHORE']
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.include ActionView::TestCase::Behavior, example_group: {file_path: %r{spec/presenters} }
end
