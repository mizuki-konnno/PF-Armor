class Genre < ApplicationRecord
  has_many :clothes, dependent: :destroy
  belongs_to :user
end
