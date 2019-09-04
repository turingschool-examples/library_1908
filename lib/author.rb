require './lib/book'
class Author 
  attr_reader :books

  def initialize(name_hash)
    @name = {
      first_name: name_hash[:first_name],
      last_name: name_hash[:last_name]
    }
    @books = []
  end

  def name
    "#{@name[:first_name]} #{@name[:last_name]}"
  end

  def write(title, date)
    return false if date.length < 4
    date = date[-4..-1]
    book_hash = {
      author_first_name: @name[:first_name],
      author_last_name: @name[:last_name],
      title: title,
      publication_date: date
    }
    @books.push(Book.new(book_hash))
    @books.last
  end

end
