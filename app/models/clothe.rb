class Clothe < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  attachment :clothes_image

end
