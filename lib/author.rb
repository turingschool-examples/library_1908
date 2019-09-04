require './lib/book.rb'

class Author
  attr_reader :name, :books

  def initialize(name_info)
    @name = name_info[:first_name] + " " + name_info[:last_name]
    @books = []
  end

  def write(title, pub_date)
    new_book = Book.new({
      author_first_name: "#{name.split[0]}",
      author_last_name: "#{name.split[1]}",
      title: title,
      publication_date: pub_date
      })
    @books << new_book
    # I did this because I kept getting the array as the return value
    new_book
    end
end
