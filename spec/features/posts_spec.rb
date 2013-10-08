require 'spec_helper'
require 'capybara/rspec'

feature "post creation" do
  scenario 'with title and body' do
    visit new_post_path(:yield => "post")
    fill_in 'post[title]', with: 'My Post'
    fill_in 'post[body]', with: 'Here I am.'
    click_button 'Save Post'
    expect(page).to have_content('My Post')
  end
  scenario 'if the post is a comment' do
    visit new_post_path(:yield => "comment")
    fill_in 'post[title]', with: 'My Post'
    fill_in 'post[body]', with: 'Here I am.'
    click_button 'Save Comment'
    expect(page).to have_content("My Post")
  end
end
