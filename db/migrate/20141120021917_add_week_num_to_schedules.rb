class AddWeekNumToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :week_num, :integer
    add_column :schedules, :company_id, :integer
  end
end
