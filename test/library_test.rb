require "minitest/autorun"
require "minitest/pride"
require "./lib/book"
require "./lib/author"
require "./lib/library"
require "pry"

class LibraryTest < MiniTest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_library_exists
    assert_instance_of Library, @dpl
  end

  def test_library_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_dpl_has_authors_and_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @charlotte_bronte.add_book(@jane_eyre)
    @charlotte_bronte.add_book(@professor)
    @charlotte_bronte.add_book(@villette)
    @harper_lee.add_book(@mockingbird)
    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
    @dpl.add_books_to_libray
    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
  end

  def test_time_frame_for_books_written_by_author
    @dpl.add_author(@charlotte_bronte)
    # @dpl.add_author(@harper_lee)
    @charlotte_bronte.add_book(@jane_eyre)
    @charlotte_bronte.add_book(@professor)
    @charlotte_bronte.add_book(@villette)
    # @harper_lee.add_book(@mockingbird)
    @dpl.add_books_to_libray
    expected = {:start=>"1847", :end=>"1857"}
    assert_equal expected , @dpl.publication_time_frame_for(@charlotte_bronte)
  end



end
