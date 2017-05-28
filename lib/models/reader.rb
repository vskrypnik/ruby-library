# frozen_string_literal: true

class Reader
  attr_accessor :name
  attr_accessor :email
  attr_accessor :city
  attr_accessor :street
  attr_accessor :house

  def initialize(name = nil, email = nil, city = nil, street = nil, house = nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
