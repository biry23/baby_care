class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy  # 記事を削除するとお気に入りも削除
  belongs_to :member
  belongs_to :genre, optional: true

  validates :title, presence: true
  validates :text, presence: true

  # member_idとpost_idが一致するfavoriteがなければ、nillを返す
  def favorited_by(member)
    Favorite.find_by(member_id: member.id, post_id: id)
  end
end
