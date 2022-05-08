class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :post
  # 同じユーザーが同じ投稿を複数回お気に入り登録させないため。
  validates :member_id, uniqueness: { scope: :post_id }
end
