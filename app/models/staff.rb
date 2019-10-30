class Staff < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, presence: true, uniqueness: true
  validates :content, presence: true
  validates :gender, presence: true
  has_many :following, dependent: :destroy
end
