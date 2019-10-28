class Feed < ApplicationRecord
  belongs_to :staff

  mount_uploader :image, ImageUploader
end
