# frozen_string_literal: true

class Author
  attr_accessor :name
  attr_accessor :biography

  def initialize(name = nil, biography = nil)
    @name = name
    @biography = biography
  end
end
