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

  def test_initialization
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_new_book_is_book_class

    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, @jane_eyre
    # require 'pry'; binding.pry

  end

  def test_book_has_title
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal "Jane Eyre", @jane_eyre.title
  end

  def test_books_added
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal [@jane_eyre], @charlotte_bronte.books

     @villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal [@jane_eyre, @villette], @charlotte_bronte.books
  end










end
