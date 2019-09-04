require './lib/book.rb'
require './lib/author.rb'

class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame_for(author)
    first = nil
    last = nil
    author.books.each do |book|
      if first.nil? || book.publication_year < first
        first = book.publication_year
      end
      if last.nil? || book.publication_year > last
        last = book.publication_year
      end
    end
    ({start: first, end: last})
  end
end
