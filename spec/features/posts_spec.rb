require 'spec_helper'
require 'capybara/rspec'

feature "Post creation" do
  scenario 'with title and body' do
    visit new_post_path
    fill_in 'post[title]', with: 'My Post'
    fill_in 'post[body]', with: 'Here I am.'
    click_button 'Save Post'
    expect(page).to have_content('My Post')
  end
end