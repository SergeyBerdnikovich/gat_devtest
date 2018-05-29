class CreateLocationGroupsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :location_groups_locations, id: false do |t|
      t.references :location,       null: false, index: true
      t.references :location_group, null: false, index: true
    end
  end
end
