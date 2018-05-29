FactoryBot.define do
  factory :country do
    sequence(:code) { |n| "code#{n}" }
    association :panel_provider, factory: :panel_provider

    trait :with_locations do
      transient do
        location_count 5
      end

      after(:create) do |country, evaluator|
        create :location_group, :with_locations, name: "PPC: #{country.panel_provider.code}/ CC: #{country.code}",
                                                 location_count:    evaluator.location_count,
                                                 panel_provider_id: country.panel_provider.id,
                                                 country_id:        country.id
      end
    end
  end
end
