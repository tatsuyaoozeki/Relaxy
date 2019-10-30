class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :menu, optional: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
