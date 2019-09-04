class Author
  attr_reader :name, :books

  def initialize(name)
    @first_name = name[:first_name]
    @last_name = name[:last_name]
    @books = []
  end

  def name
    [@first_name, @last_name].join(" ")
  end



end
