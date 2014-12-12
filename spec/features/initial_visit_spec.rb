require 'rails_helper'

describe "the signin process", :type => :feature do
  
  let(:user) { create(:user) }

  before :each do
  end

  it "signs me in and redirects to the prep page" do
    visit ("/")
    within("#login_box") do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Sign in'
    expect(page.current_path).to eq home_preparation_path
  end
end