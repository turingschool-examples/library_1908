class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books_array = []
    @authors = []
  end

  def add_author(author)
    @authors.push author
  end

  def books
    @authors.each do |author|
        author.books.each do |book|
          book_being_added = book
          @books_array.push book_being_added
      # binding.pry
      end
    end
    @books_array
  end

  def publication_time_frame_for(author)
    {:start => start_date(author), :end => end_date(author)}
  end

  #---------------helper
  def start_date(author)
    # author.books.min_by do |book|
    years = []
    author.books.each do |book|
      years.push book.publication_year
    end
    return years.min

    #   year = book.publication_year
      # binding.pry
    # end
    # return year
  end

  def end_date(author)
    years = []
    author.books.each do |book|
      years.push book.publication_year
    end
    return years.max
  end
end
