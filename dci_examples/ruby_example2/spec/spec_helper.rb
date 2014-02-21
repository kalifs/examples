require 'bundler/setup'

ENV["DB_NAME"] = "test.db"
require_relative '../lib/app'

RSpec.configure do |config|
  config.before(:each) do
    MyApp.migrate rescue nil
  end

  config.after(:each) do
    [:projects, :users].each do |name|
      ::DB.run("DROP TABLE #{name}")
    end
  end
end