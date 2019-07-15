require "dotenv"
require "active_record"
require "mysql2"
require "yaml"
require "erb"

Dotenv.load

ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read('config/database.yml')).result)
ActiveRecord::Base.establish_connection(ENV.fetch("APP_ENV", "development").to_sym)
