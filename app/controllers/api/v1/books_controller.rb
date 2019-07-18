require "json"
require_relative "./base_controller"
require_relative "../../../../models/book"

class Api::V1::BooksController < Api::V1::BaseController
  get "/" do
    Book.all.to_json
  end

  post "/", provides: :json do
    Book.create(book_params(JSON.parse(request.body.read)))

    redirect '/api/v1/books/'
  end

  put "/:id/", provides: :json do
    @book = Book.find(params["id"])
    @book.update(book_params(JSON.parse(request.body.read).except(:id)))

    redirect '/api/v1/books/'
  end

  delete "/:id/" do
    Book.find(params["id"]).destroy
    redirect '/api/v1/books/'
  end

  private
    def book_params(params)
      params.symbolize_keys.slice(
        :title,
        :author,
        :volume,
        :isCompleted,
        :note
      )
    end
end
