require 'rails_helper'

describe "the signin process", :type => :feature do
  
  let(:user) { create(:user) }

  before :each do
  end

  it "signs me in" do
    visit ("/")#login_box > form > div.two.fields
    within("#login_box") do
      fill_in 'user_email', :with => 'ilia.reingold@gmail.com'
      fill_in 'user_password', :with => 'control3'
    end
    click_button 'Sign in'
    #binding.pry
    expect(page.current_path).to have_content 'erb'
  end
end