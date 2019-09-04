class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    # require 'pry'; binding.pry
  end

  def books
    @books.flatten
  end
end
