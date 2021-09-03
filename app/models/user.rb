class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cordes, dependent: :destroy
  has_many :wish_list, dependent: :destroy
  has_many :clothes, dependent: :destroy
end
