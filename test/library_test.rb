require 'minitest/autorun'
require 'minitest/pride'
# require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")

    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_initialize
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.authors
    assert_equal [], @dpl.books
    assert_equal [], @dpl.checked_out_books
  end

  def test_it_can_add_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
  end

  def test_publication_time_frame_for_author
    assert_equal ({:start=>"1847", :end=>"1857"}), @dpl.publication_time_frame_for(@charlotte_bronte)

    assert_equal ({:start=>"1960", :end=>"1960"}), @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_cannot_check_out_missing_books
    assert_equal false, @dpl.checkout(@mockingbird)
  end

  def test_can_check_out_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal true, @dpl.checkout(@mockingbird)
    assert_equal true, @dpl.checkout(@villette)
    assert_equal [@mockingbird, @villette], @dpl.checked_out_books
  end

  def test_cannot_check_out_checked_out_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@mockingbird)

    assert_equal false, @dpl.checkout(@mockingbird)
  end

  def test_it_can_return_checked_out_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@mockingbird)
    assert_equal false, @dpl.books.include?(@mockingbird)

    @dpl.return(@mockingbird)

    assert_equal [], @dpl.checked_out_books
    assert_equal true, @dpl.books.include?(@mockingbird)
  end

  def test_returns_most_popular_book
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_nil @dpl.most_popular_book

    @dpl.checkout(@villette)
    @dpl.return(@villette)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)

    assert_equal @mockingbird, @dpl.most_popular_book

    @dpl.checkout(@villette)
    @dpl.return(@villette)

    assert_equal @villette, @dpl.most_popular_book
  end
end
