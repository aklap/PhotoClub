require 'rails_helper'
require 'spec_helper'

feature 'individual posts can be deleted' do
  background do
    user = create :user
    post = create(:post)
    visit '/'
    click_link 'Log In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Login'
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

