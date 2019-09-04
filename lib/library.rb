class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors.push(author)

    author.books.each do |book|
      @books.push(book)
    end
  end

end
