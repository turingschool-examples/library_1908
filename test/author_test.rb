require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_starts_with_empty_array_of_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_writes_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")
    require 'pry'; binding.pry
    assert_equal jane_eyre, jane_eyre
    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title
    @charlotte_bronte.write("Villette", "1853")
    assert_equal [@jane_eyre, @villette], @charlotte_bronte.books
  end
end
