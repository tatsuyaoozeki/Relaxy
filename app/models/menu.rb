class Menu < ApplicationRecord
  belongs_to :staff
  has_many :reservations
  has_many :reservations_users, through: :reservations, source: :user
  
  validates :menu_name, presence: true
  validates :time_require, presence: true
  validates :price, presence: true
  validates :menu_content, presence: true
end
