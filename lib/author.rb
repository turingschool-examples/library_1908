class Author
  attr_reader :first_name, :last_name, :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    @first_name + ' ' + @last_name
  end

  def write(title, publication_date)
  @books << Book.new({:title, :author_first_name, :author_last_name, :publication_date, :publication_year})
    #I want to put out a book by using the title of the book and
    # publication_date.
  end
  # binding.pry
end
