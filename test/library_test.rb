require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require 'pry'


class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")

    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_can_add_author
    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_it_adds_authors_books
    assert_equal 4, @dpl.books.count
  end

  def test_it_knows_time_frame
    binding.pry
    assert_equal {:start => "1847", :end => "1857"}, @dpl.publication_time_frame_for(@charlotte_bronte)
  end

end
