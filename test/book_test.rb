require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill a Mockingbird",
      publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Book, @book
  end

  def test_attributes_at_init
    assert_equal "To Kill a Mockingbird", @book.title
    assert_equal "Harper Lee", @book.author
    assert_equal 1960, @book.publication_year
  end

  def test_popularity
    assert_equal 0, @book.popularity

    @book.popularity += 1
    @book.popularity += 1

    assert_equal 2, @book.popularity
  end

  def test_checked_out?
    assert_equal false, @book.checked_out?

    @book.check_out

    assert_equal true, @book.checked_out?
  end

  def test_return
    assert_equal false, @book.checked_out?
    @book.check_out
    assert_equal true, @book.checked_out?
    @book.return
    assert_equal false, @book.checked_out?
  end
end
