class Author
  attr_reader :name, :books
  def initialize(name)
    @name = name[:first_name] + ' ' + name[:last_name]
    @books = []
  end

  def write(book_name, book_publication)
    new_book = Book.new({author_first_name: @name.split[0], author_last_name: @name.split[1], title: book_name, publication_date: book_publication})
    @books << new_book
    new_book
  end
end
