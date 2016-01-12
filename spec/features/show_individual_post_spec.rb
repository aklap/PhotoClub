require 'rails_helper'
require 'spec_helper'

feature 'index page links to posts' do
  background do
    user = create :user
    post_one = create(:post, caption: "It is better to be unhappy and know the worst, than to be happy in a fool's paradise.")
    post_two = create(:post, caption: "I'm drunk but truthful.")

    sign_in_with user
  end

  scenario 'index has clickable link to post show page' do
    mock_post = create(:post, caption: 'I am a link')

    visit '/'
    click_link('I am a link')
    expect(page.current_path).to eq(post_path(mock_post))
  end
end
