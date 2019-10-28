class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :staff
  validates :user_id, presence: true, uniqueness: true
  validates :content, presence: true
end
