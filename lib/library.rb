class Library
  attr_reader :name,
              :authors,
              :books,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @check_out_count = Hash.new(0)
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    years = []
    time_frame = {}
    author.books.each {|book| years << book.publication_year}
    time_frame[:start] = years.min
    time_frame[:end] = years.max
    time_frame
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      @check_out_count[book] += 1
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @check_out_count.max_by { |book, count| count }[0]
  end

end
