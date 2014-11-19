class Schedule < ActiveRecord::Base
  has_many :users, through: :shifts
  has_many :shifts

  def self.last_week
    Date.today.cweek - 1
  end
end
