class Book
  attr_reader :title,
              :author,
              :publication_year

  def initialize(params)
    @title = params[:title]
    @author = params[:author_first_name] + ' ' + params[:author_last_name]
    @publication_year = params[:publication_date][-4..-1]
  end

end
