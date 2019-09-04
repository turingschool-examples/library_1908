require './lib/author'

class Library < Author
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    start_book = author.books.min_by {|book| book.publication_year}
    end_book = author.books.max_by {|book| book.publication_year}

    {
      :start => start_book.publication_year.to_s,
      :end => end_book.publication_year.to_s,
    }
  end

end
