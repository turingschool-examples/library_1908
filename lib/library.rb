class Library

  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @book_checkout_count = {}
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    hash = {start: first_published_book(author), end: last_published_book(author)}
    hash
  end

  def last_published_book(author)
    book_last = 0
    author.books.each do |book|
      if book.publication_year.to_i > book_last
        book_last = book.publication_year.to_i
      end
    end
    book_last.to_s
  end

  def first_published_book(author)
    book_first = 2019
    author.books.each do |book|
      if book.publication_year.to_i < book_first
        book_first = book.publication_year.to_i
      end
    end
    book_first.to_s
  end

  def checkout(book)
    book_tracker(book)
    return false if !@books.include?(book)
    return false if @checked_out_books.include?(book)
    @checked_out_books << book
    return true
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    book_count = @book_checkout_count.sort_by { |book, checkout_num| checkout_num}
    require 'pry'; binding.pry
    book_count.last
  end

  def book_tracker(book)
    count = 0
    @book_checkout_count[book] = count += 1
  end

end
