class Api::V1::TagsController < Api::V1::BaseController
  def index
    tags = Tag.all
    render json: { tags: tags, serializer: Api::V1::TagSerializer }
  end

  def add
    tags = Tag.where(id: params[:tags])
    tags.each do |tag|
      book.book_tag_joins.where(tag: tag).first_or_create!
    end

    render json: book, serializer: Api::V1::BookSerializer
  end

  def remove
    book_tags = book.book_tag_joins.where(tag_id: params[:tags])
    book_tags.delete_all

    render json: book, serializer: Api::V1::BookSerializer
  end

  private

  def book
    @book ||= Book.find(params[:book_id])
  end
end
