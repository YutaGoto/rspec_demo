require 'rails_helper'

RSpec.feature 'Posts', type: :system do
  context 'with index action' do
    background do
      @post = Post.create(
        name: "name",
        title: "title",
        content: "body content",
      )
    end

    it 'To Show H1 informations' do
      visit posts_path
      sleep(1)
      expect(page).to have_content 'Posts'
    end

    it 'To Show Posts informations' do
      visit posts_path
      sleep(1)
      expect(page).to have_content @post.title
    end
  end

  context 'with new action' do
    it 'To Show new Post form' do
      visit new_post_path
      sleep(1)
      expect(page).to have_content 'New Post'
    end

    it 'To create Post' do
      visit new_post_path
      fill_in "post[name]", with: 'test name'
      fill_in "post[title]", with: 'test title'
      fill_in "post[content]", with: 'test content'
      sleep(1)
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
    end

    it 'if Title is null, cannot create Post' do
      visit new_post_path
      fill_in "post[name]", with: 'name'
      fill_in "post[content]", with: 'content'
      click_button 'Create Post'

      expect(page).to have_content "Title can't be blank"
    end
  end
end

