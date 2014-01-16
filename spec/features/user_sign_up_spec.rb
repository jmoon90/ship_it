require 'spec_helper'

feature 'user signs up' do
  scenario 'with valid information and cohort' do
    visit new_sessions_path
    fill_in 'Email', with: 'j@aol.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmtion', with: 'password'
    fill_in 'Cohort', with: 'winter 2012'

    click_on 'Sign up'
  end
end


