class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :schedules, through: :shifts
  has_many :shifts
  #scope :shifts, -> { Shift.joins(:users).where(:user_id => current.user_id) }
end
