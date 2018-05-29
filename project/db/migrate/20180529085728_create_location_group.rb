class CreateLocationGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :location_groups do |t|
      t.string     :name,           null: false
      t.references :country,        null: false, index: true
      t.references :panel_provider, null: false, index: true

      t.timestamps null: false
    end
  end
end
