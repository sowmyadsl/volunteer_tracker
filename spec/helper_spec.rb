require 'rspec'
require 'pg'
require 'volunteer'
require 'project'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteer *;")
    DB.exec("DELETE FROM project *;")
  end
end
