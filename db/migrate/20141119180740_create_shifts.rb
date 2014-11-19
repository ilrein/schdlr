class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :schedule, index: true

      t.timestamps
    end
  end
end
