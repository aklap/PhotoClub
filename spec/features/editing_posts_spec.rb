# create a job with factory_girl
# visit the root route
# click the image of the post we created with factory_girl
# click the 'edit post' link
# fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
# click the ’Update Post’ button
# expect the page to have content saying "Post updated hombre."
# expect the page to have content saying “Oh god, you weren’t meant to see this picture!”

feature '' do
  scenario '' do
    post = create(:post, caption: 'stuff here')

    visit '/'
    find('stuff here').click
  end
end
