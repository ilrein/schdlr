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

  context "(2) JSON API Methods for current_user" do

    let(:user) { FactoryGirl.create(:user) }
    let(:schedule) { FactoryGirl.create(:schedule) }
    let(:shift) { FactoryGirl.create(:shift, user_id: user.id, schedule_id: schedule.id) }
    let(:last_weeks_schedule) { FactoryGirl.create(:schedule, week_num: Date.today.cweek - 1).id }
    let(:last_weeks_shift) { FactoryGirl.create(:shift, user_id: user.id, schedule_id: last_weeks_schedule) }

    before(:each) do  
      DatabaseCleaner.clean
    end

    describe ".shifts returns all shifts" do
      it { expect(user.shifts).to include shift }
    end
    
    describe ".last_weeks_shifts returns all shifts for LAST week" do 
      it { expect(user.last_weeks_shifts).to include last_weeks_shift and not include shift }
    end
    
    describe ".this_weeks_shifts returns all shifts for THIS week" do 
      it { expect(user.this_weeks_shifts).to match_array(shift.all_this_week) }
    end
    
    describe ".next_weeks_shifts returns all shifts for NEXT week" do
      context "if none are booked" do 
        it { expect(user.next_weeks_shifts).to_not be_nil }
      end
    end
    
    # describe ".shift_today? returns true if it has a shift today" do 
    #   it { expect(@user.shift_today?).to equal true or false }
    # end
  end
end
