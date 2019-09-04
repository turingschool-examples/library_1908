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

  def test_for_checkout
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(charlotte_bronte)
    @dpl.checkout(jane_eyre)
    assert_equal 1, @dpl.checked_out_books.length
    assert_equal 2, @dpl.books.length
  end

  def test_for_return
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(charlotte_bronte)
    @dpl.checkout(jane_eyre)
    assert_equal 1, @dpl.checked_out_books.length
    assert_equal 2, @dpl.books.length
    @dpl.return(jane_eyre)
    assert_equal 0, @dpl.checked_out_books.length
    assert_equal 3, @dpl.books.length
  end

  def test_for_most_popular_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(charlotte_bronte)
    @dpl.checkout(jane_eyre)
    @dpl.return(jane_eyre)
    assert_equal jane_eyre, @dpl.most_popular_book
    @dpl.checkout(the_professor)
    @dpl.return(the_professor)
    @dpl.checkout(the_professor)
    @dpl.return(the_professor)
    assert_equal the_professor, @dpl.most_popular_book
  end
end
