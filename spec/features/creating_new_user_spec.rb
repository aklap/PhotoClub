feature 'Creating a new user' do
  background do
    visit '/'
    click_on 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'User name' with: 'sxyrailsdev'
    fill_in 'Email' with: 'sxyrailsdev@myspace.com'
    fill_in 'Password' with: 'supersecret'
    fill_in 'Password confirmation' with: 'supersecret'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
   end
end
