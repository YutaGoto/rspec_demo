# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  sequence :name do |n|
    "Bob #{n}"
  end

  sequence :title do |n|
    "Hello World #{n}"
  end

  sequence :content do |n|
    "こんにちは #{n}"
  end

  factory :post do
    name
    title
    content

    after(:create) do |post|
      create_list(:comment, 3, post: post)
    end
  end
end
