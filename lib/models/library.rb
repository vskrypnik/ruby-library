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
    @orders.group_by(&:reader).transform_values(&:count).to_a.sort_by(&:last).last&.first
  end

  def what_is_the_most_popular_book
    most_popular_books.last
  end

  def how_many_people_ordered_one_of_the_three_most_popular_books
    most_popular_books.last(3).reduce(0) do |count, book|
      count + @orders.count { |order| order.book == book }
    end
  end

  private

  def most_popular_books
    @orders.group_by(&:book).transform_values(&:count).to_a.sort_by(&:last).map(&:first)
  end
end
