require 'rails_helper'

RSpec.describe Shift, :type => :model do
  
  before :each do 
    @shift = build(:shift)
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

end
