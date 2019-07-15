require "bundler/setup"
require "dotenv"
require "active_record"
require "mysql2"
require "yaml"
require "erb"

Dotenv.load

class Base < ActiveRecord::Base
  databases = YAML.load(ERB.new(File.read('config/database.yml')).result)
  establish_connection(databases[Rails.env])
  self.abstract_class = true
end
