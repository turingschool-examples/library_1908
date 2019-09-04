require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @name = @first_name + ' ' + @last_name
    @books = []
  end

  def write(title, publication_date)
    book_params = {
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
    }

    book = Book.new(book_params)
    @books.push(book)
    book
  end


end
