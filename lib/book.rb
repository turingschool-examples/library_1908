class Book
  attr_reader :title, :author, :publication_date, :publication_year

  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author]
    @publication_date = attributes[:publication_date]
  end

  def publicaiton_year
    @publication_date[-4]
  end
end
