class Doctor < ApplicationRecord
  has_many :patient1s, dependent: :destroy 
  belongs_to :user
  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
  validates :name ,presence: true
  validates :specialisation ,presence: true
  validates :department ,presence: true
end
