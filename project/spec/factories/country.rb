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

    trait :with_target_groups do
      transient do
        child_nodes_count 3
      end

      after(:create) do |country, evaluator|
        create :target_group, :with_child_nodes, panel_provider:    country.panel_provider,
                                                 child_nodes_count: evaluator.child_nodes_count
      end
    end
  end
end
