class GoogleBooksApi
  def initialize(api_key = ENV["GOOGLE_API_KEY"])
    @api_key = api_key
  end

  def search_by_isbn(isbn)
    response = connection.get do |request|
      request.url "volumes", q: "isbn:#{isbn}", key: @api_key
    end
    handle_response(response)
  end

  private

  def connection
    @connection ||= Faraday.new("https://www.googleapis.com/books/v1")
  end

  def handle_response(response)
    status = response.status
    body = response.body
    raise "#{status}, #{body}" unless status == 200

    body
  end
end
