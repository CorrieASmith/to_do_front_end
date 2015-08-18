require('rspec')
require('pg')
require('task')
require('list')

DB = PG.connect({:dbname => 'to_do_test'})

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
