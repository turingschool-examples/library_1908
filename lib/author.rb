require './lib/book'

class Author
  attr_reader :books, :name, :first_name, :last_name
  def initialize(author)
    @name = author[:first_name] + " " + author[:last_name]
    @books = []
    @first_name = author[:first_name]
    @last_name = author[:last_name]
  end

  def write(title, publication_date)
    book = {
      title: title,
      author_first_name: @first_name,
      author_last_name: @last_name,
      publication_date: publication_date
    }
    new_book = Book.new(book)
    @books << new_book
    new_book
  end


end
