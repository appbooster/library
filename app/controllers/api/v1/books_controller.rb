class Api::V1::BooksController < ApiController
  def index
    books = Book.all
    render json: books, each_serializer: Api::V1::BookSerializer
  end

  def search
    result = Book::SearchByIsbn.new.call(params[:isbn])
    render json: result
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book
    else
      render status: :unprocessable_entity, json: { errors: book.errors }
    end
  end

  private

  def book_params
    permitted_params = %i[title subtitle authors publisher description cover_image page_count isbn_10 isbn_13]
    params.require(:book).permit(permitted_params)
  end
end
