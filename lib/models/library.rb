# frozen_string_literal: true

class Library
  attr_accessor :books
  attr_accessor :readers
  attr_accessor :orders
  attr_accessor :authors

  def initialize(data = {})
    @books   = data[:books]   || []
    @orders  = data[:orders]  || []
    @readers = data[:readers] || []
    @authors = data[:authors] || []
  end

  def who_often_takes_the_books
    sort_entity_by_orders_count(:reader).first
  end

  def what_is_the_most_popular_book
    most_popular_books.first
  end

  def how_many_people_ordered_one_of_the_three_most_popular_books
    most_popular_books.first(3).map do |book|
      @orders.select { |order| order.book == book }
    end.flatten.map(&:reader).uniq.count
  end

  private

  def most_popular_books
    sort_entity_by_orders_count(:book)
  end

  def sort_entity_by_orders_count(entity)
    @orders.group_by(&entity).transform_values(&:count).to_a.sort_by(&:last).map(&:first).reverse
  end
end
