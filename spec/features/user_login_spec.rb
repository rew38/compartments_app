require 'spec_helper'

describe 'sign up' do
  it 'should a sign up link on the homepage' do
    visit root_path
    expect(page).to have_content("Sign Up")
  end
end
