class Book
  attr_reader :title,
              :author,
              :publication_year

  def initialize(info)
    @title = info[:title]
    @author = info[:author_first_name] + " " + info[:author_last_name]
    @publication_year = info[:publication_date].scan(/\d{4}/)[0]
  end


  def ==(book)
    @title == book.title && @author == book.author && @publication_year == book.publication_year
  end





end
