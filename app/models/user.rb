class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :staff, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :feeds, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :followed_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :followed, through: :followed_relationships
  has_many :following, dependent: :destroy

  validates :name, presence: true

end
