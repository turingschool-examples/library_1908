class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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
    if books.include?(book)
      checked_out_books << book
      books.delete(book)
      book.popularity += 1
      return true
    else
      return false
    end
  end

  def checked_out_books
    @checked_out_books
  end

  def return(book)
    books << book
    checked_out_books.delete(book)
  end

  def most_popular_book
    all_books = checked_out_books + books
    all_books.max_by {|book| book.popularity }
  end

end
