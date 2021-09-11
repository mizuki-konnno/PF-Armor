class WishList < ApplicationRecord

  belongs_to :user

  attachment :wish_list_image

  validates :wish_list_image, presence: true

end
