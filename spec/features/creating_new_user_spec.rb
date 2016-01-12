require 'rails_helper'
require 'spec_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_on 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'sxyrailsdev'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :prefer_exact
    fill_in 'Password confirmation', with: 'supersecret', match: :prefer_exact
    click_on 'Sign Up'

    expect(page.current_path).to eq '/'
    expect(page).to have_content 'Welcome! Registration successful.'
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :prefer_exact
    fill_in 'Password confirmation', with: 'supersecret', match: :prefer_exact
    click_on 'Sign Up'

    expect(page).to have_content "Username can't be blank"
  end

  scenario 'requires a username to be more than 4 characters' do
    fill_in 'Username', with: 'h'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :prefer_exact
    fill_in 'Password confirmation', with: 'supersecret', match: :prefer_exact
    click_on 'Sign Up'

    expect(page).to have_content 'Username is too short (minimum is 4 characters)'


  end
end
