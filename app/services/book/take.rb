class Book::Take
  def call(book:, user:)
    return Result::Failure.new("No items available") unless book.available_items_count.positive?

    return Result::Failure.new("You already took this book") if book.taken_by?(user)

    book.transaction do
      book.decrement!(:available_items_count)
      book.book_reader_interactions.create!(user: user, taken_at: Time.zone.now)
    end

    Result::Success.new(book)
  end
end
