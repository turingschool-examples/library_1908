class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

 # can be cleaned up with helper methods if there is time...
  def publication_time_frame_for(author)
    publication_range = {}
    first_book = author.books.min_by do |book|
      book.publication_year
    end
    last_book = author.books.max_by do |book|
      book.publication_year
    end
    publication_range[:start] = first_book.publication_year
    publication_range[:end] = last_book.publication_year
    publication_range
  end

end
