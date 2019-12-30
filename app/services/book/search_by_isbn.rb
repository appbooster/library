class Book::SearchByIsbn
  def call(isbn_input)
    isbn = process_isbn_input(isbn_input)
    response = GoogleBooksApi.new.search_by_isbn(isbn)
    build_book(response)
  end

  private

  def process_isbn_input(isbn_input)
    isbn_input.scan(/\d/).join("")
  end

  def build_book(response)
    return { found: false } if response["totalItems"].zero?

    book_object = response.dig("items", 0, "volumeInfo")
    identifiers = book_object["industryIdentifiers"].each_with_object({}) do  |id, obj|
      obj[id["type"]] = id["identifier"]
    end

    {
      found: true,
      result: {
        title: book_object["title"],
        subtitle: book_object["subtitle"],
        authors: book_object["authors"]&.join(", ") || "unknown",
        publisher: book_object["publisher"],
        description: book_object["description"],
        isbn_10: identifiers["ISBN_10"],
        isbn_13: identifiers["ISBN_13"],
        cover_image: book_object.dig("imageLinks", "thumbnail"),
        page_count: book_object["pageCount"]
      }
    }
  end
end
