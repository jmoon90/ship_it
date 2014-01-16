require 'spec_helper'

feature 'User visit post' do
  context 'signed in' do
    scenario 'comments with valid information' do
      user = FactoryGirl.create(:user)
      log_in_user(user)
      post = FactoryGirl.create(:post, user_id: 6)
      feedback = FactoryGirl.create(:feedback, user_id: user, post_id: post)

      visit post_path(post)
      fill_in "Comment", with: feedback.comment

      click_on 'Submit Feedback'

      expect(page).to have_content(feedback.comment)
      expect(page).to have_content("Thank you. You're submission feeds my ego")
    end

    scenario 'comments with invalid information' do
      user = FactoryGirl.create(:user)
      log_in_user(user)
      post= FactoryGirl.create(:post, user_id: 5)
      visit post_path(post)
      click_on 'Submit Feedback'

      expect(page).to have_content('Invalid information. Please try again')
    end
  end

  scenario 'only views information' do
      post= FactoryGirl.create(:post)
      visit post_path(post)
    expect(page).to_not have_content "Submit Feedback"
  end
end
