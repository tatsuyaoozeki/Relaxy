class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :menu, optional: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_before_start
  validate :date_before_end

  def date_before_start
    errors.add(:start_date, "の日付を正しく記入して下さい。") if
    start_date < Date.today
  end

  def date_before_end
    errors.add(:end_date, "の日付を正しく記入して下さい。") if
    end_date < Date.today
  end
end
