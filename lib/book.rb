class Book
  attr_reader :title, :author, :publication_year
  attr_accessor :popularity

  def initialize(info)
    @title = info[:title]
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @publication_year = info[:publication_date].split.last.to_i
    @popularity = 0
    @checked_out = false
  end

  def checked_out?
    @checked_out
  end

  def check_out
    @checked_out = true
  end

  def return
    @checked_out = false
  end

end
