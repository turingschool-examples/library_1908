require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require 'pry'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = Book.new("Jane Eyre", "October 16, 1847")
    @villette = Book.new("Villette", "1853")
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_has_books
    assert_equal [], @charlotte_bronte.books

  @charlotte_bronte.add_book(@jane_eyre)
  @charlotte_bronte.add_book(@villette)
    assert_equal [@jane_eyre, @villette], @charlotte_bronte.books
  end
  #
  def test_it_has_a_class
    assert_instance_of Book, @jane_eyre.class
  end

  def test_it_has_a_title
    assert_equal "Jane Eyre", @jane_eyre.title
  end
end
