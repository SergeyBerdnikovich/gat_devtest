class CreateTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups do |t|
      t.string     :name,           null: false
      t.string     :secret_code,    null: true
      t.integer    :external_id,    null: true
      t.integer    :parent_id,      null: true,  index: true
      t.references :panel_provider, null: false, index: true

      t.timestamps null: false
    end
  end
end
