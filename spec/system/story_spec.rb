require 'rails_helper'

RSpec.feature 'Story', type: :system do
  scenario 'すとーり' do
    visit '/posts'

    click_link 'New Post'

    fill_in 'Name', with: 'なまえ'
    fill_in 'Title', with: 'たいとる２'
    fill_in 'Content', with: 'ぼでｈし'

    click_button 'Create Post'

    fill_in 'Commenter', with: 'こめんたー'
    fill_in 'Body', with: 'ぼでぃ'
    click_button 'Create Comment'

    click_link 'Back'
  end
end
