class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :post
  # 同じユーザーが同じ投稿を複数回お気に入り登録させないため。
  validates_uniqueness_of :post_id, scope: :member_id
end
