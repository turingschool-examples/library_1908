class Book
  attr_reader :author,
              :title,
              :publication_date
  def initialize(info)
    @author = info[:author_first_name] + ' ' + info[:author_last_name]
    @title = info[:title]
    @publication_date = info[:publication_date].split(', ')[1]
  end
end
