class Staff < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, presence: true, uniqueness: true
  validates :content, presence: true
  validates :gender, presence: true
  has_many :following, dependent: :destroy

  # def following?(staff, user)
  #   staff.following.find_by(user_id: user.id)
  # end
end
