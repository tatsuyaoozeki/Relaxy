class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one :staff
  has_many :staffs, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
