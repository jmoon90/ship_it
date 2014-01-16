require 'spec_helper'

feature 'user uploads image' do
  given(:local_path) { File.join(Rails.root, '/spec/support/bug.jpg') }
  scenario 'of bug and puts it up' do
    post = FactoryGirl.create(:post)
    log_in_user(post.user)
    visit post_path(post)
    fill_in "Comment", with: "I found a bug on the page and I uploaded a image of the bug"
    attach_file('feedback_image', local_path)

    click_on 'Submit Feedback'

    expect(page).to have_content("Thank you. You're submission feeds my ego")
  end
end

