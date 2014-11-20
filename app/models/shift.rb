class Shift < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :user

  def week_of
    self.schedule.week_num
  end
end
