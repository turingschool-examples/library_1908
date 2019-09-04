class Author
  attr_reader :name, :books
  def initialize(author_info)
    @name = author_info[:first_name] + " " + author_info[:last_name]
    @books = []
  end

  def write(title, publication_year)
    new_book = Book.new({author_first_name: @name.split[0], author_last_name: @name.split[-1], title: title, publication_date: publication_year})
    @books.push new_book
    new_book
  end
end
