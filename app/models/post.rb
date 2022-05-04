class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy  # 記事を削除するとお気に入りも削除
  belongs_to :member
  belongs_to :genre
end
