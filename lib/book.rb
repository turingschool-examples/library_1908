class Book
  attr_reader :title, :author, :publication_year

  def initialize(information)
    @title = information[:title]
    @author = information[:author_first_name] + " " + information[:author_last_name]
    @publication_year = information[:publication_date][-4..-1]
  end
end
