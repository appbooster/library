class Book::Subscribe
  def call(book:, user:)
    return Result::Failure.new("You currently reading this book") if book.taken_by?(user)

    return Result::Failure.new("You already subscribed to this book") if book.awaited_by?(user)

    user.subscriptions.create!(book: book)
    Result::Success.new(book)
  end
end
