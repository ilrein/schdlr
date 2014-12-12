require 'rails_helper'

describe "the signin process", :type => :feature do

  let(:user) { create(:user) }

  before :each do
  end

  context "signs me in and redirects to the prep page" do
    it "I can login with a valid email/pw" do
      visit ("/")
      within("#login_box") do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
      end
      click_button 'Sign in'
      expect(page.current_path).to eq home_preparation_path
    end
    it "I cannot login with an invalid email/pw" do
      visit ("/")
      within("#login_box") do
        fill_in 'user_email', with: "invalid"
        fill_in 'user_password', with: "invalid"
      end
      click_button 'Sign in'
      expect(page.current_path).to eq ("/")
    end
  end
  
end