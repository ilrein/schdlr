class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :company_id
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
