class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def add_books_to_libray
    books = []
    @authors.each do |author|
      books << author.books
    end
    @books = books.flatten
  end

end
