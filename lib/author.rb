require './lib/book'
class Author
  attr_reader :books
  def initialize(author_hash)
    @first_name = author_hash[:first_name]
    @last_name = author_hash[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, date)
    @books << Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: date})

    return @books.last
  end

end
