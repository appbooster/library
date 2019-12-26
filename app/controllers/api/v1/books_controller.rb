class Api::V1::BooksController < ApiController
  def index
    books = Book.all
    render json: books
  end

  def search
    result = Book::SearchByIsbn.new.call(params[:isbn])
    render json: result
  end
end
