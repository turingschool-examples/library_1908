class Author

  attr_reader :name, :books

  def initialize(author_info)
    @author_info = author_info
    @name = @author_info[:first_name] + " " + @author_info[:last_name]
    @books = []
  end

  def write(title, publication_date)
    Book.new({author_first_name: "Harper", author_last_name: "Lee", title: title, publication_date: publication_date})
  end

  def add_book(book)
    @books << book
  end
end
