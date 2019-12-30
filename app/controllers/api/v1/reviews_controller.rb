class Api::V1::ReviewsController < Api::V1::BaseController
  def create
    book = Book.find(params[:book_id])
    review = book.reviews.new(user: @current_user, body: review_params[:body])

    if review.save
      render json: review
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
