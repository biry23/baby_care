class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post

  validates :comment_text, presence: true
end
