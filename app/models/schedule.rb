class Schedule < ActiveRecord::Base
  has_many :users, through: :shifts
  has_many :shifts
  belongs_to :company

  def self.last_week
    Schedule.where(:week_num => Date.today.cweek - 1)
  end
  def self.this_week
    Schedule.where(:week_num => Date.today.cweek)
  end
end
