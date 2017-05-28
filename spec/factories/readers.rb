# frozen_string_literal: true

FactoryGirl.define do
  factory :reader do
    name   { Faker::Name.name }
    email  { Faker::Internet.email }
    city   { Faker::Address.city }
    street { Faker::Address.street_name }
    house  { Faker::Address.building_number }
  end
end
