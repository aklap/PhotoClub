require 'rails_helper'
require 'spec_helper'

feature 'user authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to have_no_content('New Post')

    click_on 'Log In'
    fill_in 'Username', with: 'lazarus'
    fill_in 'Password', with: 'blackstar'
    click_on 'Login'

    expect(page).to have_content('Login successful!')
    expect(page.current_path).to eq '/posts'
    expect(page).to have_content("Log Out")
  end

  scenario 'can log out once logged in' do
    visit '/'
    click_on 'Log In'
    fill_in 'Username', with: 'lazarus'
    fill_in 'Password', with: 'blackstar'
    click_on 'Login'
    click_on 'Log Out'
    expect(page).to have_content('Signed out successfully!')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario ' cannot create a new post without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
