class Shift < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :user

  def week_of
    self.schedule.week_num
  end
  def all_this_week
    all_shifts_this_week = Shift.where(self.week_of)
  end
end
