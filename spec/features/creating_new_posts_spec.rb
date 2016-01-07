require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/espresso.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Publish'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='espresso.jpg']")
  end
end
