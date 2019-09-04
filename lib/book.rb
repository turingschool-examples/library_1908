class Book

  attr_reader :author_first_name, :author_last_name, :author, :title, :publication_date, :publication_year

  def initialize(book)
    @author_first_name = book[:author_first_name]
    @author_last_name = book[:author_last_name]
    @author = "#{@author_first_name} #{@author_last_name}"
    @title = book[:title]
    @publication_date = book[:publication_date]
    @publication_year = book[:publication_date].split[2]
  end
end
