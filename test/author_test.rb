require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_full_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_starts_with_no_books_written
    assert_equal [], @charlotte_bronte.books
  end

  def test_can_write_a_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_books_get_added_to_author
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal [jane_eyre], @charlotte_bronte.books
  end

end
