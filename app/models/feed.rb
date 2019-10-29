class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :content, presence: true
end
