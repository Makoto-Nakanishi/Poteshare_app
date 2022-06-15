class Reservation < ApplicationRecord
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validates :people_number, numericality: true, presence: true
 
  belongs_to :user
  belongs_to :event
end
