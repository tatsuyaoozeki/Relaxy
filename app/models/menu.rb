class Menu < ApplicationRecord
  belongs_to :staff
  has_many :reservations
end
