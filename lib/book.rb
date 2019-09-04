class Book
  attr_reader :title

  def initialize(book_hash)
    @title = book_hash[:title]
    @author = {
              first_name: book_hash[:author_first_name],  
              last_name: book_hash[:author_last_name]
    }
    @publication_date = book_hash[:publication_date]
  end

  def author
    "#{@author[:first_name]} #{@author[:last_name]}"
  end

  def publication_year
    @publication_date.split[2]
  end

end