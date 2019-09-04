require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require './lib/book'

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

  def test_initialization
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_it_can_add_authors_and_their_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
    assert_equal 4, @dpl.books.count
  end

  def test_publication_time_frame_for_author
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal ({:start=>"1847", :end=>"1857"}), @dpl.publication_time_frame_for(@charlotte_bronte)
    assert_equal ({:start=>"1960", :end=>"1960"}), @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_it_can_checkout_books
    assert_equal false, @dpl.checkout(@mockingbird)
    assert_equal false, @dpl.checkout(@jane_eyre)
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal true, @dpl.checkout(@jane_eyre)
    assert_equal [@jane_eyre], @dpl.checked_out_books
    assert_equal false, @dpl.checkout(@jane_eyre)
  end

  def test_books_can_be_returned
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)
    assert_equal [@jane_eyre, @villette], @dpl.checked_out_books
    @dpl.return(@jane_eyre)
    assert_equal [@villette], @dpl.checked_out_books
  end

  def test_finding_most_popular_book #failing

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    @dpl.checkout(@jane_eyre)
    @dpl.checkout(@villette)

    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)
    @dpl.checkout(@mockingbird)
    @dpl.return(@mockingbird)

    assert_equal @mockingbird, @dpl.most_popular_book
  end

end
