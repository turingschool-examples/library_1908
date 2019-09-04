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

    # first_book_year = author.books.each do |book|
    #   book.publication_year.to_i.max
    # end
    first_book_year = author.books.min_by do |book|
      book.publication_year.to_i
      
    end

    last_book_year = author.books.max_by do |book|
      book.publication_year.to_i
      # return book.publication_year
    end
    # binding.pry
    time_frame = {
      :start => first_book_year.to_s,
      :end => last_book_year.to_s
    }
    return time_frame
  end
end
