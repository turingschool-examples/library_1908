class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
end
