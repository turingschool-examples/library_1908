require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookTest < Minitest::Test

  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a mocking bird", publication_date: "July 11, 1960"})
  end

  def test_it_exits
    assert_instance_of Book, @book
  end

  def test_it_has_attributes
    assert_equal "To Kill a mocking bird", @book.title
    assert_equal "Harper", @book.author_first_name
    assert_equal "Lee", @book.author_last_name
    assert_equal "July 11, 1960", @book.publication_date
  end

  def test_it_has_publication_year
    assert_equal "1960", @book.publication_year
  end
end
