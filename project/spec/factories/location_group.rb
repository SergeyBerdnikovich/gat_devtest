FactoryBot.define do
  factory :location_group do
    sequence(:name)   { |n| "location group name ##{n}" }
    country_id        { 1 }
    panel_provider_id { 1 }

    trait :with_locations do
      transient do
        location_count 5
      end

      after(:create) do |location_group, evaluator|
        location_group.locations << create_list(:location, evaluator.location_count)
      end
    end
  end
end
