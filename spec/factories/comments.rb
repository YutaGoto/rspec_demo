# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  sequence :commenter do |n|
    "Dad #{n}"
  end

  sequence :body do |n|
    "Hello World #{n}"
  end

  factory :comment do
    commenter
    body
  end
end
