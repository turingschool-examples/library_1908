require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_initialization
    assert_equal "Denver Public Library", @dpl.name

    assert_equal [], @dpl.books

    assert_equal [], @dpl.authors
  end

  def test_add_author

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_add_books
    @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books

  end





end
