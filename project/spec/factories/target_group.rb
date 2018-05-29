FactoryBot.define do
  factory :target_group do
    sequence(:name) { |n| "target group name ##{n}" }
    external_id     { 1 }
    parent_id       { nil }
    secret_code     { 1 }
    association     :panel_provider, factory: :panel_provider

    trait :with_child_nodes do
      transient do
        child_nodes_count 3
      end

      after(:create) do |target_group, evaluator|
        node = target_group

        evaluator.child_nodes_count.times do |i|
          new_child_node = create(:target_group, panel_provider: target_group.panel_provider, parent_id: node.id)

          node.child_nodes << new_child_node

          node = new_child_node
        end
      end
    end
  end
end
