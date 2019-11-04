class Menu < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reservations_users, through: :reservations, source: :user

  validates :menu_name, presence: true, length: { maximum: 30 }
  validates :time_require,  presence: true, format: { with: /\[0-9]/}
  validates :price, presence: true, format: { with: /\[0-9]/}
  validates :menu_content, presence: true, length: { maximum: 255 }
end
