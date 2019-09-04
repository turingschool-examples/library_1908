require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require 'pry'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a mocking bird", publication_date: "July 11, 1960"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte", @charlotte_bronte.first_name
    assert_equal "Bronte", @charlotte_bronte.last_name
  end

  def test_it_has_a_full_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_can_add_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_write
    assert_equal @jane_eyre, @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end
  # binding.pry
end
