class Corde < ApplicationRecord

  belongs_to :user

  attachment :corde_image

  validates :corde_image, presence: true

  has_many :favorites, dependent: :destroy

　# いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end




end
