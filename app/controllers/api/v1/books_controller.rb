require_relative "./base_controller.rb"

class Api::V1::BooksController < Api::V1::BaseController
  get "/" do
    "this is books controller"
  end
end
