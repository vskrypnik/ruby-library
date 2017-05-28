# frozen_string_literal: true

class Order
  attr_accessor :book
  attr_accessor :reader
  attr_accessor :date

  def initialize(book = nil, reader = nil, date = nil)
    @book = book
    @reader = reader
    @date = date
  end
end
