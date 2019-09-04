require './lib/author'
require 'pry'

class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books += author.books
  end

  def publication_time_frame_for(author)
    first_book_year = author.books.min_by do |book|
      book.publication_year.to_i
    end

    last_book_year = author.books.max_by do |book|
      book.publication_year.to_i
    end
  
    time_frame = {
      :start => first_book_year.publication_year,
      :end => last_book_year.publication_year
    }
    return time_frame
  end
end
