require 'spec_helper'
require 'capybara/rspec'

feature "post creation" do
  scenario 'with title and body' do
    visit new_post_path(:yield => "post")
    fill_in 'post[title]', with: 'My Post'
    fill_in 'post[body]', with: 'Here I am.'
    click_button 'Create Post'
    expect(page).to have_content('My Post')
  end

  scenario 'with invalid title' do
    visit new_post_path
    fill_in 'post[title]', with: 'bad'
    fill_in 'post[body]', with: 'A complete sentence.'
    click_button 'Create Post'
    expect(page).to have_content("too short")
  end

  scenario 'if the post is a comment' do
    visit new_post_path(:yield => "comment")
    fill_in 'post[title]', with: 'My Post'
    fill_in 'post[body]', with: 'Here I am.'
    click_button 'Save Comment'
    expect(page).to have_content("My Post")
  end
end

