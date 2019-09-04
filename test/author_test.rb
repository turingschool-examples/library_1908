require 'minitest/autorun'
require 'minitest/pride'
require './lib/book.rb'
require './lib/author.rb'

class AuthorTest < Minitest::Test
  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_a_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_starts_with_no_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_write_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal [jane_eyre], @charlotte_bronte.books

    @charlotte_bronte.write("Villete", "1853")
    assert_equal 2, @charlotte_bronte.books.length
  end
end
