require 'spec_helper'

feature 'guest visits post index page' do
  given(:post) { FactoryGirl.create(:post, user_id: 5) }
  scenario 'sees all posts' do
    post
    visit posts_path
    expect(page).to have_content(post.name)
  end

  context 'user is signed in' do
    before(:each) do
      user = FactoryGirl.create(:user)
      log_in_user(user)
    end

    scenario 'can vote on posts' do
      post
      visit posts_path
      click_on 'High Five'

      expect(page).to have_content('1 High Five')
    end
  end
end
