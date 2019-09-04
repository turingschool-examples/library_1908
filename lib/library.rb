class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    authors << author
    books << author.books
    books.flatten!
  end

  def publication_time_frame_for(author)
    start_book = author.books.min_by {|book| book.publication_year}
    end_book = author.books.max_by {|book| book.publication_year}

    {
      :start => start_book.publication_year.to_s,
      :end => end_book.publication_year.to_s,
    }
  end

  def checkout(book)
    if books.include?(book) && !book.checked_out?
      book.check_out
      book.popularity += 1
      return true
    else
      return false
    end
  end

  def checked_out_books
    books.find_all {|book| book.checked_out? }
  end

  def return(book)
    book.return
  end

  def most_popular_book
    books.max_by {|book| book.popularity }
  end

end
