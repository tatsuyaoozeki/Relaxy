class Staff < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  validates :user_id, presence: true

  has_many :staffs, dependent: :destroy

  def favorite?(staff, user)
    project.favorites.find_by(user_id: user.id)
  end
end
