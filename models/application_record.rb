require "active_record"
require_relative "../db/database"

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
