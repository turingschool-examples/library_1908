require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exits
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end
end
