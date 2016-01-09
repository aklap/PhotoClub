require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'needs an image to create a post' do
  scenario 'cannot create post without image file' do
  visit '/'
  click_link 'New Post'
  fill_in 'Caption', with: 'I forgot an image'
  click_button 'Publish'
  expect(page).to have_content("Oops, I can't see anything. You need an image to post!")
  end
end
