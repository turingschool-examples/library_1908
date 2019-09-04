require './lib/book'

class Author < Book
  attr_reader :name, :books

  def initialize(info)
    @name = info[:first_name] + " " + info[:last_name]
    @books = []
  end

  def write(title, publication_date)
    book_info = {
      author_first_name: name.split.first,
      author_last_name: name.split.last,
      title: title,
      publication_date: publication_date,
    }
    book = Book.new(book_info)
    books << book
    book
  end

end
