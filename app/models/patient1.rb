class Patient1 < ApplicationRecord
    belongs_to :doctor
    belongs_to :user
    validates :name ,:patientid, :doctor_id, :presence => true
    scope :active_users, -> { where(active: true) }
    scope :inactive_users, -> { where(active: false) }
end