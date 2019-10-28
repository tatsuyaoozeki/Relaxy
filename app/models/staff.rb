class Staff < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  validates :user_id, presence: true, uniqueness: true
  validates :content, presence: true
  validates :gender, presence: true

  has_many :staffs, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :relationship_users, through: :relationships, source: :user


  def relationship?(staff, user)
    staff.relationships.find_by(user_id: user.id)
  end
end
