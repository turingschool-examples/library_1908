class Author
  attr_reader :first_name, :last_name, :title, :publication_year, :name, :books

  def initialize(author)
    @first_name = author[:first_name]
    @last_name = author[:last_name]
    @name = author[:first_name] + " #{author[:last_name]}"
    @books = []
  end

  def write(title, date)
    @books << Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: date})
  end
end
