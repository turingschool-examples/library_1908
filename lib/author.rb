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

end
