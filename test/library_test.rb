require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    @charlotte_bronte.write(
      "Jane Eyre",
      "October 16, 1847"
    )
    @professor = charlotte_bronte.write(
      "The Professor",
      "1857"
    )
    @villette = charlotte_bronte.write(
      "Villette",
      "1853")
    @harper_lee = Author.new({
      first_name: "Harper",
      last_name: "Lee"})
    @mockingbird = harper_lee.write(
      "To Kill a Mockingbird",
      "July 11, 1960"
    )
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_initialization
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_it_can_add_authors
    assert_equal @dpl.add_author(charlotte_bronte)
  end

end
