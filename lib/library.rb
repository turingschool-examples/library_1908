require './lib/book.rb'
require './lib/author.rb'

class Library
  attr_reader :name,
              :authors,
              :checked_out_books,
              :checkout_count

  def initialize(name)
    @name = name
    @authors = []
    @checked_out_books = []
    @checkout_count = Hash.new(0)
  end

  def books
    books = []
    @authors.each do |author|
      books << author.books
      books = books.flatten
    end
    books
  end

  def add_author(author)
    @authors << author
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

  def checkout(book)
    if !@books.nil? || @checked_out_books.include?(book) || !(books.include?(book))
      false
    else
      @checked_out_books << book
      @checkout_count[book] += 1
      true
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      true
    else
      false
    end
  end

  def most_popular_book
    most_popular = ""
    most_checkouts = 0
    @checkout_count.each do |book, checkouts|
      #require 'pry'; binding.pry
      if checkouts > most_checkouts
        most_popular = book
        most_checkouts = checkouts
      elsif checkouts == most_checkouts
        most_popular = [most_popular] << book
      end
    end
    most_popular
  end
end
