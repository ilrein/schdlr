class AddUserIdToShifts < ActiveRecord::Migration
  def change
    change_table :shifts do |t|
      t.references :user, index: true
    end

  end
end
