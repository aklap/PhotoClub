require 'rails_helper'
require 'spec_helper'

feature 'individual posts can be deleted' do
  background do
    post = create(:post)

    visit '/'
    click_link 'nofilter'
  end

  scenario 'user can delete a post' do
    click_on 'Edit Post'
    click_on 'Delete'

    expect(page.current_path).to eq root_path
    expect(page).to have_content('Post destroyed!')
    expect(page).to have_no_content('nofilter')
  end
end

