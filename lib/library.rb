class Library
  attr_reader :name, :authors, :books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    author.books.each do |book|
      @books << book
    end
    
    @authors << author
  end
end
