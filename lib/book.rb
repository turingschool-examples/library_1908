class Book

  attr_reader :title, :author, :publication_year

  def initialize(book_hash)
    @title = book_hash[:title]
    @author = book_hash[:author_first_name] + " " + book_hash[:author_last_name]
    @publication_year = book_hash[:publication_date][-4..-1]
  end

end
