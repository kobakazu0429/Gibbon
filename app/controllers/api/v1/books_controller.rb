require "json"
require_relative "./base_controller"
require_relative "../../../../models/book"

class Api::V1::BooksController < Api::V1::BaseController
  get "/" do
    Book.all.to_json
  end

  post "/", provides: :json do
    @payload = JSON.parse(request.body.read)
    @book = Book.new do |b|
      b.title = @payload["title"]
      b.author = @payload["author"]
      b.volume = @payload["volume"]
      b.isCompleted = @payload["isCompleted"]
      b.note = @payload["note"]
    end
    @book.save

    redirect '/api/v1/books/'
  end

  put "/:id/", provides: :json do
    @payload = JSON.parse(request.body.read)

    @book = Book.find(params["id"])

    @book.title = @payload["title"]
    @book.author = @payload["author"]
    @book.volume = @payload["volume"]
    @book.isCompleted = @payload["isCompleted"]
    @book.note = @payload["note"]
    @book.save

    redirect '/api/v1/books/'
  end

  delete "/:id/" do
    Book.find(params["id"]).destroy
    redirect '/api/v1/books/'
  end
end
