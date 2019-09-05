class Book
  attr_reader :title

  def initialize(book)
    @title = book[:title]
    @author = book[:author_first_name] + book[:author_last_name]
    @publication_date = book[:publication_date]
  end
  
end
