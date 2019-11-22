class Staff < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, presence: true, uniqueness: true
  validates :content, presence: true, length: { maximum: 600 }
  validates :gender, presence: true
  enum gender: {男性: 0, 女性: 1}
  has_many :following, dependent: :destroy
end
