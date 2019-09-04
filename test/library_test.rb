require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
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

  def test_it_has_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
    assert_equal [], @dpl.checked_out_books
  end

  def test_can_add_authors
    @dpl.add_author(@charlotte_bronte)
    assert_equal [@charlotte_bronte], @dpl.authors

    @dpl.add_author(@harper_lee)
    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_adding_authors_adds_books
    @dpl.add_author(@charlotte_bronte)
    assert_equal [@jane_eyre, @professor, @villette], @dpl.books

    @dpl.add_author(@harper_lee)
    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
  end

  def test_can_get_time_frame_for_authors
    hash = {:start=>"1847", :end=>"1857"}
    assert_equal hash, @dpl.publication_time_frame_for(@charlotte_bronte)

    hash = {:start=>"1960", :end=>"1960"}
    assert_equal hash, @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_can_checkout_book
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    assert_equal true, @dpl.checkout(@jane_eyre)
    assert_equal [@jane_eyre], @dpl.checked_out_books

    assert_equal true, @dpl.checkout(@professor)
    assert_equal [@jane_eyre, @professor], @dpl.checked_out_books
  end

  def test_increments_checked_out_counter
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)
    @dpl.checkout(@jane_eyre)
    assert_equal 2, @dpl.times_checked_out[@jane_eyre]
  end

  def test_cannot_checkout_books_that_do_not_exist
    assert_equal false, @dpl.checkout(@jane_eyre)
  end

  def test_cannot_checkout_books_that_are_already_checked_out
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)
    assert_equal false, @dpl.checkout(@jane_eyre)
  end

  def test_can_return_book
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)
    assert_equal [], @dpl.checked_out_books
  end

  def test_can_get_most_popular_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)
    @dpl.return(@jane_eyre)
    @dpl.checkout(@jane_eyre)
    assert_equal @jane_eyre, @dpl.most_popular_book

    @dpl.checkout(@professor)
    @dpl.return(@professor)
    @dpl.checkout(@professor)
    @dpl.return(@professor)
    @dpl.checkout(@professor)
    @dpl.return(@professor)
    assert_equal @professor, @dpl.most_popular_book
  end

end

