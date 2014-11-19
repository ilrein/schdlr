class Schedule < ActiveRecord::Base
  has_many :users, through: :shifts
  has_many :shifts
end
