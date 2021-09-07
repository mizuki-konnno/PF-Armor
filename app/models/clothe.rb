class Clothe < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  attachment :clothe_image

end
