class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_authors(author)
    @authors << author
    author_books = @authors.map do |author|
      author.books
    end
    author_books.flatten
  end

end
