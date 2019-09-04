require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require 'pry'


class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_knows_full_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_starts_books_as_empty_array
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_write_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_it_stores_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @charlotte_bronte.write("Villette", "1853")
  
    assert_equal 2, @charlotte_bronte.books.count
  end

end
