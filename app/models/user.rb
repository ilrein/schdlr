class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :schedules, through: :shifts
  has_many :shifts
  
  def last_weeks_shifts
    Shift.where(:user_id => self.id, :schedule_id => Schedule.last_week)
  end
end
