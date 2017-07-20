require 'active_record'
require 'mocks/order'
require 'mocks/user'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Schema.verbose = false
load 'mocks/schema.rb'
