# frozen_string_literal: true

class Book
  attr_accessor :title
  attr_accessor :author

  def initialize(title = nil, author = nil)
    @title = title
    @author = author
  end
end
