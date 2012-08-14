require 'mongoid'
require 'mongoid-simple-roles'

Mongoid.load!("mongoid.yml", :test)

RSpec.configure do |config|
  config.after(:each) do
    Mongoid::Config.purge!
  end
end