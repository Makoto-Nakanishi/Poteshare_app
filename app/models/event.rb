class Event < ApplicationRecord
  validates :room_name, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :address, presence: true

  has_many :reservations, dependent: :destroy
  belongs_to :user

  has_one_attached :image

end
