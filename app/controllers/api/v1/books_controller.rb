require "json"
require_relative "./base_controller"
require_relative "../../../../models/book"

class Api::V1::BooksController < Api::V1::BaseController
  get "/" do
    Book.all.to_json
  end

  post "/", provides: :json do
    Book.create(JSON.parse(request.body.read))

    redirect '/api/v1/books/'
  end

  put "/:id/", provides: :json do
    @book = Book.find(params["id"])
    @book.update(JSON.parse(request.body.read))

    redirect '/api/v1/books/'
  end

  delete "/:id/" do
    Book.find(params["id"]).destroy
    redirect '/api/v1/books/'
  end
end
