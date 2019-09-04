class Book
  attr_reader :title

  def initialize(book_hash)
    @author_first_name = book_hash[:author_first_name]
    @author_last_name = book_hash[:author_last_name]
    @title = book_hash[:title]
    @publication_date = book_hash[:publication_date]
  end

  def author
    @author_first_name + @author_last_name
  end

  # def publication_year
  #   @publication_date
  # end
end
