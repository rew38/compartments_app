require 'spec_helper'

describe 'sign up' do
  it 'should a sign up link on the homepage' do
    visit root_path
    expect(page).to have_content("Sign Up")
  end

  it 'should have a sign up form when the sign up link is clicked' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_content("User Registration")
  end

   it "should allow a new user to sign up successfully" do
    visit root_path
    click_link "Sign Up"
    fill_in 'First name', with: 'gerald'
    fill_in 'Last name', with: 'geraldman'
    fill_in 'Email', with: 'gerald@gerald.com'
    fill_in 'Password', with: 'gerald'
    fill_in 'Password confirmation', with: 'gerald'
    click_button 'Create User'
    expect(page).to have_content('gerald')
  end
end

describe "log in" do
  describe "Sign In process" do
   it "should allow a returning user to sign in" do
    visit root_path
    click_link "Sign Up"
    fill_in 'First name', with: 'gerald'
    fill_in 'Last name', with: 'geraldman'
    fill_in 'Email', with: 'gerald@gerald.com'
    fill_in 'Password', with: 'gerald'
    fill_in 'Password confirmation', with: 'gerald'
    click_button 'Create User'
    click_link "Login"
    fill_in 'Email', with: 'gerald@gerald.com'
    fill_in 'Password', with: 'gerald'
    click_on 'Login'
    #This isn't sending test to signed in page
    #it is staying on the sign in form page
    expect(page).to have_content('Welcome Gerald')
  end
end
end
