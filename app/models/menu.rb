class Menu < ApplicationRecord
  belongs_to :staff
  has_many :reservations
  validates :menu_name, presence: true
  validates :time_require, presence: true
  validates :price, presence: true
  validates :menu_content, presence: true
end
