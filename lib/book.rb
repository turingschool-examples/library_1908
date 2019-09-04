class Book
  attr_reader :title, :author_first_name, :author_last_name, :publication_date, :publication_year

  def initialize(attributes)
    @title = attributes[:title]
    @author_first_name = attributes[:author_first_name]
    @author_last_name = attributes[:author_last_name]
    @publication_date = attributes[:publication_date]
  end

  def publication_year
    @publication_date[9..12]
  end
end
