require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_initialization
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_write_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, jane_eyre
    # vilette = @charlotte_bronte.write("Villette", "1853")

  end
end
