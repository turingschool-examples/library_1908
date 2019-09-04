class Author
  attr_reader :name,
              :books

  def initialize(info)
    @info = info
    @name = info[:first_name] + " " + info[:last_name]
    @books = []
  end

  def write(title, publication_date)
    info = @info
    if @books.length < 1
      info[:author_first_name] = info.delete :first_name
      info[:author_last_name] = info.delete :last_name
      info[:title] = title
      info[:publication_date] = publication_date
      book = Book.new(info)
      @books << book
      book
    else
      info[:title] = title
      info[:publication_date] = publication_date
      book = Book.new(info)
      @books << book
      book
    end
  end





end
