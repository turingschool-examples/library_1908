require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})

  end

  def test_existence_of_author
    assert_instance_of Author, @charlotte_bronte
  end

  def test_name_of_author
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_charlotte_bronte_writes_books
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, @jane_eyre
  end

  def test_new_book_info
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, @jane_eyre.class
    assert_equal "Jane Eyre", @jane_eyre.title
  end

  def test_case_name
     @villette = @charlotte_bronte.write("Villette", "1853")
     assert_equal Book, @villette.class
     @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
     assert_equal [@villette, @jane_eyre], @charlotte_bronte.books
  end

end
