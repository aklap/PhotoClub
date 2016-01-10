require 'rails_helper'
require 'spec_helper'

feature 'index page links to posts' do
  scenario 'index has clickable link to post show page' do
    mock_post = create(:post, caption: 'I am a link')

    visit '/'
    click_link('I am a link')
    expect(page.current_path).to eq(post_path(mock_post))
  end
end
