class Library
  attr_reader :name, :books, :authors, :checked_out_books, :times_checked_out

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @times_checked_out = {}
  end

  def add_author(author)
    @authors.push(author)
    author.books.each { |book| @books.push(book) }
  end

  def publication_time_frame_for(author)
    hash = {
      start: author.books.min_by { |book| book.publication_year }.publication_year, 
      end: author.books.max_by { |book| book.publication_year }.publication_year
    }
  end

  def checkout(book)
    return false if !@books.include?(book)
    return false if @checked_out_books.include?(book)
    @checked_out_books.push(book)
    @times_checked_out.has_key?(book) ? @times_checked_out[book] += 1 : @times_checked_out[book] = 1
    true
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @times_checked_out.key(@times_checked_out.values.max)
  end

end