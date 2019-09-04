class Book
  attr_reader :author,
              :title,
              :publication_date
              
  attr_accessor:checkout_count

  def initialize(info)
    @author = info[:author_first_name] + ' ' + info[:author_last_name]
    @title = info[:title]
    publication_date = if info[:publication_date].split(', ').length == 2
      info[:publication_date].split(', ')[1]
    else
      info[:publication_date]
    end
    @publication_date = publication_date
    @checkout_count = 0
  end
end
