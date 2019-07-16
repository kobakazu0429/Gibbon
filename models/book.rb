require_relative "./application_record.rb"

class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :volume, presence: true, numericality: { only_integer: true }
  validates :isCompleted, inclusion: { in: [true, false] }
end
