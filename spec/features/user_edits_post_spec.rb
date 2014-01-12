require 'spec_helper'

feature 'user edit post' do
  scenario 'with valid information' do
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    fill_in "Github url", with: 'http://www.yahoo.com'
    click_on 'Ship it'

    expect(page).to have_content('http://www.yahoo.com')
  end

  scenario 'with invalid information' do
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    click_on 'Ship it'
    expect(page).to have_content(post.name)
  end
end
