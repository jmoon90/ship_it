require 'spec_helper'

feature 'user posts app' do
  scenario 'with valid input' do
    visit new_post_path
    fill_in "Description", with: "App to Ship it today"
    fill_in "Name", with: "Ship It"
    fill_in "Url", with: "www.shipit.com"
    click_on "Ship it"

    expect(page).to have_content("Successfully Shipped")
  end

  scenario 'with invalid input' do
    visit new_post_path

    click_on "Ship it"
    expect(page).to have_content("Invalid information. Please try again")
  end
end
