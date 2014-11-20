require 'rails_helper'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe Shift, :type => :model do

    let(:user) { FactoryGirl.create(:user) }
    let(:schedule) { FactoryGirl.create(:schedule) }
    let(:shift) { FactoryGirl.create(:shift, user_id: user.id, schedule_id: schedule.id) }
    let(:last_weeks_schedule) { FactoryGirl.create(:schedule, week_num: Date.today.cweek - 1).id }
    let(:last_weeks_shift) { FactoryGirl.create(:shift, user_id: user.id, schedule_id: last_weeks_schedule) }

    before(:each) do  
      DatabaseCleaner.clean
    end

  describe "(1) Has Associations and Test Data" do
    context "(a) has a valid factory" do 
      it { expect(build(:shift)).to be_valid }
    end

    context "(b) references a schedule" do 
      it { expect(Shift.reflect_on_association(:schedule).macro).to eq(:belongs_to) }
    end

    context "(c) references a user" do 
      it { expect(Shift.reflect_on_association(:user).macro).to eq(:belongs_to) }
    end
  end

  context "(2) JSON API Methods" do
    describe "(b) .week_of returns current week" do 
      it "returns this current week" do 
       expect(shift.week_of).to eq Date.today.cweek 
     end
      it "returns last current week" do 
        expect(last_weeks_shift.week_of).to eq (Date.today.cweek - 1)
      end
    end
  end

end
