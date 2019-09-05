class Library
  attr_reader :name, :authors, :books, :checked_out_books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
    @popularity = Hash.new(0)
  end

  def add_author(author)
    @authors << author
    @books += author.books
  end

  def publication_time_frame_for(author)
    sorted_books = author.books_sorted_by_year
    {
      start: sorted_books.first.publication_year,
      end: sorted_books.last.publication_year,
    }
  end

  def checkout(book)
    if @books.include?(book)
      @books.delete(book)
      @checked_out_books << book
      @popularity[book] += 1
      true
    else
      false
    end

    # OR
    # return false unless @books.include?(book)
    # @checked_out_books << @books.delete(book)
    # true
  end

  def return(book)
    @books << @checked_out_books.delete(book)
  end

  def most_popular_book
    return nil if @popularity.empty?
    @popularity
      .max_by {|book, count| count }
      .first
  end
end
