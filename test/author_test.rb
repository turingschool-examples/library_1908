require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte", @charlotte_bronte.first_name
    assert_equal "Bronte", @charlotte_bronte.last_name
  end
end
