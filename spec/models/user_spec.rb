require 'rails_helper'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
      
RSpec.describe User, :type => :model do

  describe "(1) Has Associations and Test Data" do
    context "(a) has a valid factory" do 
      it { expect(build(:user)).to be_valid }
    end

    context "(b) belongs to a company" do 
      it { expect(User.reflect_on_association(:company).macro).to eq(:belongs_to) }
    end

    context "(c) has many shifts" do 
      it { expect(User.reflect_on_association(:shifts).macro).to eq(:has_many) }
    end
  end

  describe "(2) JSON API Methods for current_user" do

    before(:each) do  
      DatabaseCleaner.clean
      @user = FactoryGirl.create(:user)
      @schedule = FactoryGirl.create(:schedule)
      @shift = FactoryGirl.create(:shift, user_id: @user.id, schedule_id: @schedule.id)
    end

    context ".shifts returns all shifts" do
      it { expect(@user.shifts).to eq(Shift.where(:user_id => @user.id)) }
    end
    
    context ".last_weeks_shifts returns all shifts for LAST week" do 
      it { expect(@user.last_weeks_shifts).to eq(Shift.where(
        :user_id => @user.id,
        :schedule_id => Schedule.last_week
        )) }
    end
    
    context ".this_weeks_shifts returns all shifts for THIS week" do 
      it { expect(@user.this_weeks_shifts).to equal [] }
    end
    
    context ".next_weeks_shifts returns all shifts for NEXT week" do 
      it { expect(@user.next_weeks_shifts).to equal [] }
    end
    
    context ".shift_today? returns true if it has a shift today" do 
      it { expect(@user.shift_today?).to equal true or false }
    end
  end
end
