class Author

  def initialize(author_details)
    @first_name = author_details[:first_name]
    @last_name = author_details[:last_name]
  end

  def name
    @first_name + " " + @last_name
  end

end
