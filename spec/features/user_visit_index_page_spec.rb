require 'spec_helper'

feature 'guest visits post index page' do
  before(:each) do
    FactoryGirl.create(:user)
  end

  given(:post) { FactoryGirl.create(:post, user_id: 5) }
  scenario 'sees all posts' do
    post
    visit posts_path
    expect(page).to have_content(post.name)
  end

  context 'user is signed in' do
    scenario 'can vote on posts' do
      pending
      visit posts_path
    end
  end
end
