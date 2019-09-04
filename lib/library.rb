class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books,
              :checkout_tally

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @checkout_tally = Hash.new(0)
  end

  def add_author(author)
    @authors.push(author)

    author.books.each do |book|
      @books.push(book)
    end
  end

  def publication_time_frame_for(author)
    publication_years = author.books.map do |book|
      book.publication_year.to_i
    end

    { start: publication_years.min.to_s,
      end:   publication_years.max.to_s }
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books.push(book)
      @checkout_tally[book] += 1
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @checkout_tally.key(@checkout_tally.values.max)
  end

end
