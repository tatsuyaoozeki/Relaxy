class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # belongs_to :staff
  # has_one :staff
  # accepts_nested_attributes_for :staff
  has_many :staffs, dependent: :destroy
end
