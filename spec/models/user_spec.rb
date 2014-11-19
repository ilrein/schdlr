require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before :each do 
    @user = build(:user)
  end

  describe "(1) User has Associations and Test Data" do
    context "(a) has a valid factory" do 
      it { expect(build(:user)).to be_valid }
    end

    context "(b) belongs to a company" do 
      it { expect(User.reflect_on_association(:company).macro).to eq(:belongs_to) }
    end

    context "(c) has many shifts" do 
      it { expect(User.reflect_on_association(:shift).macro).to eq(:has_many) }
    end
  end

  describe "(2) JSON API Methods" do
    context ".weekly_shifts returns all shifts for this week" do 
      it { expect(@user.weekly_shifts).to equal [] }
    end
    context ".shift_today? returns true if it has a shift today" do 
      it { expect(@user.shift_today?).to equal true or false }
    end

  end
end
