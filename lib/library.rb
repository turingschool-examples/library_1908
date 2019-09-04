class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    books = author.books.minmax_by do |book|
      book.publication_date.to_i
    end
    {:start=>books[0].publication_date, :end=>books[1].publication_date}
  end

  def checkout(book)
    book.checkout_count += 1
    @checked_out_books << book
    @books.delete(book)
  end

  def return(book)
    @books << book
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.max_by do |book|
      book.checkout_count
    end
  end
end
