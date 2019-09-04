class Author
  attr_reader :first_name, :last_name

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
  end
end
