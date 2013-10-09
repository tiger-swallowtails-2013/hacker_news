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

feature "comment creation" do
  scenario "it is a comment and renders _comment" do
      visit new_post_path(:yield =>"comment")
      # render :partial => "posts/comment"
      expect(page).to have_content("Comment")
     end
 end

 feature "post creation" do
  scenario "it is a post and renders _post" do
      visit new_post_path(:yield =>"post")
      # render :partial => "posts/post"
      expect(page).to have_content("Post")
     end
 end
