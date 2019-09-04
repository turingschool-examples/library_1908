class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def add_book(book)
    @books << book
  end

  def class
    @book
  end

  def title
    @book.title
  end

  def write(title, publication_date)
    book_attributes = {
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
      }
    new_book = Book.new(book_attributes)
    @books << new_book
  end

end
