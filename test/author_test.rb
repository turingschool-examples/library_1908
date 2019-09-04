require "minitest/autorun"
require "minitest/pride"
require "./lib/book"
require "./lib/author"
require "pry"

class AuthorTest < MiniTest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
  end

  def test_author_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_author_can_create_book
    assert_equal Book, @jane_eyre.class
    assert_equal "Jane Eyre", @jane_eyre.title
    assert_equal Book, @villette.class
    assert_equal "Villette", @villette.title
    @charlotte_bronte.add_book(@jane_eyre)
    @charlotte_bronte.add_book(@villette)
    assert_equal [@jane_eyre, @villette], @charlotte_bronte.books
  end
end
