class Book::GiveBack
  def call(book:, user:)
    book_reader_record = book.book_reader_interactions.find_by(user: user, returned_at: nil)
    return Result::Failure.new("You didn't take this book") unless book_reader_record

    book.transaction do
      book.increment!(:available_items_count)
      book_reader_record.update!(returned_at: Time.zone.now)
    end

    Result::Success.new(book)
  end
end
