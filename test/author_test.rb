require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'


class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_knows_full_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_starts_books_as_empty_array
    assert_equal [], @charlotte_bronte.books
  end

end
