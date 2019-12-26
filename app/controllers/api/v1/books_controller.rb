class Api::V1::BooksController < ApiController
  def index
    books = Book.all
    render json: books, each_serializer: Api::V1::BookSerializer
  end

  def search
    result = Book::SearchByIsbn.new.call(params[:isbn])
    render json: result
  end
end
