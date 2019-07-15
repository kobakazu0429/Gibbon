require "bundler/setup"
require "dotenv"
require "active_record"
require "mysql2"
require "yaml"
require "erb"

Dotenv.load

ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read('config/database.yml')).result)
