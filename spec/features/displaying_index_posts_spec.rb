require 'rails_helper'
require 'spec_helper'

feature 'index shows all posts' do

  background do
    user = create :user
    post_one = create(:post, caption: "It is better to be unhappy and know the worst, than to be happy in a fool's paradise.")
    post_two = create(:post, caption: "I'm drunk but truthful.")
    sign_in_with user
  end

  scenario 'index displays valid post images and text' do
    visit '/'
    expect(page).to have_content("Log Out")
    expect(page).to have_content("It is better to be unhappy and know the worst, than to be happy in a fool's paradise.")
    expect(page).to have_content("I'm drunk but truthful.")
    expect(page).to have_css("img[src*='espresso']")
  end
end
