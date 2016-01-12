require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'individual posts can be edited' do
  background do
    user = create :user
    post = create(:post)

    sign_in_with user
    click_link 'nofilter'
  end

  scenario 'user can edit post' do
    click_on 'Edit Post'
    fill_in 'Caption', with: 'Oops'
    find_button('Publish').click

    expect(page).to have_content('Update successful!')
    expect(page).to have_content('Oops')
  end

  scenario 'user edits post with wrong or no file' do
    click_on 'Edit Post'
    fill_in 'Caption', with: 'Oops'
    page.attach_file('post_image', 'spec/files/images/More_Coffee.zip', visible: false)
    click_button 'Publish'

    expect(page).to have_content("Something went wrong.")
  end
end
