require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })

    @jane_eyre = Book.new({
      author_first_name: "Charlotte",
      author_last_name: "Bronte",
      title: "Jane Eyre",
      publication_date: "October 16, 1847"
      })
    @villete = Book.new({
      title: "Villette",
      publication_date: "1853"
      })
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
    assert_instance_of Book, @jane_eyre
    assert_instance_of Book, @villete
  end

  def test_initialization
    assert_equal "Charlotte", @charlotte_bronte.first_name
    assert_equal "Bronte", @charlotte_bronte.last_name
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_return_the_complete_name
    @charlotte_bronte.first_name
    @charlotte_bronte.last_name

    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_books_can_be_listed_by_author
    @charlotte_bronte.add_book(@jane_eyre)
    @charlotte_bronte.add_book(@villete)

    assert_equal [@jane_eyre, @villete], @charlotte_bronte.books
  end

  def test_class_is_returned_for_book
    assert_equal Book, @jane_eyre.class
  end

  def test_title_is_returned_for_book
    assert_equal "Jane Eyre", @jane_eyre.title
  end

  def test_it_can_write_a_new_book
    assert_equal @jane_eyre, @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end

end
