# frozen_string_literal: true

FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }

    association :author, strategy: :build
  end
end
