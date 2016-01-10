# PhotoClub
[![Circle Ci](https://circleci.com/gh/aklap/PhotoClub.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/aklap/PhotoClub)

A TDD Instagram clone

PhotoClub is an exercise in test-driven development.

#Why?
Because I needed the practice. Was also told that I 'can't do whatever I want' when coding; this is probably true. And it's probably a good thing to have when you tinker too much with code.

#Tools used include:

-RSpec: Ruby testing library/framework/DSL that allows you to run your code and match to certain expectations, returning pass/fail.

-Capybara: a web-based automated testing framework that simulates user actions.

-SimpleCov: Gem that provides test coverage reporting.

-CircleCI: a continuous integration/delivery service for web applications. Continuous integration is a practice of merging code into a shared repo with code being merged in verified by a build (literally, building your app & running tests) beforehand. Your build will 'fail' if CircleCI (or your app of choice) cannot build and pass your tests. (Thoughtworks has a blurb on this.)

#Future Features:
-User authentication via OAuth
-Authorization, with admins
-Responsive grid system
-Photo manipulation?

# Issues/Adventures in Problems
Capybara: 'Element not found.'
Rails & buttons: 'Routing Error' & [POST] route not found

#Notes:
- Attachments need a file field in the forms.
- File fields will not appear unless you use the correct CSS locator; in Rails this means your css selector might be nested, (i.e., 'post_image' not 'image'). If you do not follow this, it's 'Element not found.'
- Buttons are horrible in rails. A link_to is always a get; a button is always a 'post,' forms are easier to trouble shoot if you use f.submit rather then create button_to that might throw a 'routing error.'

You will need to utilize an explicit method declaration in your button field if it is anything other than doing some sort of post.

- Capybara and CircleCI are slooow.
- TDD and BDD require a massive paradigm shift for a beginner coding student and also delayed gratification (both v. unpleasant); probably why so many people are averse.


