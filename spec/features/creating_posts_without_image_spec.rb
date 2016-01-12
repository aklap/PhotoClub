require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'needs an image to create a post' do

  background do
    user = create :user
    post_one = create(:post, caption: "It is better to be unhappy and know the worst, than to be happy in a fool's paradise.")
    post_two = create(:post, caption: "I'm drunk but truthful.")

    sign_in_with user
  end

  scenario 'cannot create post without image file' do
  visit '/'
  click_link 'New Post'
  fill_in 'Caption', with: 'I forgot an image'
  click_button 'Publish'
  expect(page).to have_content("Oops, I can't see anything. You need an image to post!")
  end
end
