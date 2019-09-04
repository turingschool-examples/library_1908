class Book

  attr_reader :title, :author, :publication_year

  def initialize(book_info)
    @book_info = book_info
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @author = @book_info[:author_first_name] + " " + @book_info[:author_last_name]
    @title = book_info[:title]
    @publication_date = book_info[:publication_date]
    @publication_year =  book_info[:publication_date].split.last

  end


end
