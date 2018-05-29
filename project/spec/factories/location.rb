FactoryBot.define do
  factory :location do
    sequence(:name)        { |n| "location name ##{n}" }
    sequence(:external_id) { |n| n }
    sequence(:secret_code) { |n| n }
  end
end
