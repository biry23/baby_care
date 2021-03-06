class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy  # 会員を削除するとお気に入りも削除

  validates :member_name, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :introduction, presence: true
end
