require "sinatra"
require_relative "./app/controllers/api/v1/books_controller.rb"

run Rack::URLMap.new({
  "/api/v1/books" => Api::V1::BooksController,
})
