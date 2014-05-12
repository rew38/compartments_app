require 'spec_helper'

describe 'sign up' do
  it 'should allow a user to register for the site' do
    visit root_path
    expect(page).to have_content("Sign Up")
  end
end
