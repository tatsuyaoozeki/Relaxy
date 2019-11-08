class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :menu, optional: true
  validates :start_date, presence: true
  validate :date_before_start


  def date_before_start
    errors.add(:start_date, "は今日以降のものを選択してください") if
    start_date < Date.today
  end
end
