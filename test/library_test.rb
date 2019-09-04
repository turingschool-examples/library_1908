require './lib/book'
require './lib/author'
require './lib/library'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_has_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_add_author
    @dpl.add_author(Author.new({first_name: "Charlotte", last_name: "Bronte"}))
    assert_equal 1, @dpl.authors.length
  end

  def test_add_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @dpl.add_author(charlotte_bronte)
    assert_equal 1, @dpl.books.length
  end

  def test_for_publication_time_frame
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    charlotte_bronte.write("The Professor", "1857")
    charlotte_bronte.write("Villette", "1853") 
    @dpl.add_author(charlotte_bronte)
    assert_equal ({:start=>"1847", :end=>"1857"}), @dpl.publication_time_frame_for(charlotte_bronte)
  end
end
