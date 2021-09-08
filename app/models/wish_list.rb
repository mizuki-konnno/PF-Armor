class WishList < ApplicationRecord

  belongs_to :user

  attachment :wish_list_image

end
