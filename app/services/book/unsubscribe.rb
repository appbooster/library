class Book::Unsubscribe
  def call(book:, user:)
    return Result::Failure.new("You are not subscribed to this book") unless book.awaited_by?(user)

    user.subscriptions.where(book: book).delete_all
    Result::Success.new(book)
  end
end
