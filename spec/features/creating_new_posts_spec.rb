require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user
    post_one = create(:post, caption: "It is better to be unhappy and know the worst, than to be happy in a fool's paradise.")
    post_two = create(:post, caption: "I'm drunk but truthful.")

    sign_in_with user
  end

  scenario 'can create a post' do
    visit '/'
    click_on "New Post"
    attach_file("post_image", "spec/files/images/espresso.jpg", visible: false)
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Publish'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='espresso.jpg']")
  end
end
