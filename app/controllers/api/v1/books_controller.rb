class Api::V1::BooksController < Api::V1::BaseController
  def index
    books = Book.includes(:active_book_reader_interactions)
    render json: books, each_serializer: Api::V1::BookSerializer, include: "**"
  end

  def search
    result = Book::SearchByIsbn.new.call(params[:isbn])
    render json: result
  end

  def create
    book = Book.new(book_params)
    book.available_items_count = book_params[:total_items_count]
    if book.save
      render json: book
    else
      render status: :unprocessable_entity, json: { errors: book.errors }
    end
  end

  def show
    render json: book
  end

  def take
    call_service_and_respond Book::Take
  end

  def give_back
    call_service_and_respond Book::GiveBack
  end

  def subscribe
    call_service_and_respond Book::Subscribe
  end

  def unsubscribe
    call_service_and_respond Book::Unsubscribe
  end

  private

  def call_service_and_respond(service_klass)
    result = service_klass.new.call(book: book, user: @current_user)

    if result.success?
      render json: result.value, serializer: Api::V1::BookSerializer
    else
      render json: result, status: :unprocessable_entity
    end
  end

  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    permitted_params = %i[title subtitle authors publisher description cover_image page_count isbn_10 isbn_13
                          total_items_count]
    params.require(:book).permit(permitted_params)
  end
end
