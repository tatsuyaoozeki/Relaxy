class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :staff, dependent: :destroy
  # belongs_to :staff, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :feeds, dependent: :destroy
  has_many :menus, dependent: :destroy

  validates :name, presence: true

end
