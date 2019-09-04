class Author
  attr_reader :first_name, :last_name, :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @books = []
  end

  def name
      "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    @books << @jane_eyre = Book.new({author_first_name: "Charlotte",
                          author_last_name: "Bronte",
                          title: "Jane Eyre",
                          publication_date: "October 16, 1847"})
    @books.last
  end

end
