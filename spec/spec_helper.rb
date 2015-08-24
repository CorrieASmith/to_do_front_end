ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('task')
require('list')



RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks * ;")
  end
end

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists * ;")
  end
end
