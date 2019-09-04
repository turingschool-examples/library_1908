require './lib/book.rb'
require './lib/author.rb'

class Library
  attr_reader :name,
              :authors,
              :checked_out_books,
              :book_inventory,
              :checkout_count

  def initialize(name)
    @name = name
    @authors = []
    @book_inventory = []
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
    @book_inventory << author.books
    @book_inventory = @book_inventory.flatten
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
    if !@book_inventory.include?(book)
      false
    else
      @book_inventory.delete(book)
      @checked_out_books << book
      @checkout_count[book] += 1
      true
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @book_inventory << book
      @checked_out_books.delete(book)
      true
    else
      false
    end
  end

  def most_popular_book
    most_popular = ""
    most_checkouts = 0
    @checkout_count.keys.each do |book, checkouts|
      if checkouts > most_checkouts
        most_popular = book
      elsif checkouts == most_checkouts
        most_popular = [most_popular] << book
      end
    end
  end
end
