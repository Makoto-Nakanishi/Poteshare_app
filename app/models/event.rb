class Event < ApplicationRecord
  validates :room_name, presence: true
  validates :content, presence: true
  validates :price, numericality: true, presence: true
  validates :address, presence: true
  
  has_many :reservations, dependent: :destroy
  belongs_to :user

  has_one_attached :image

  def self.search(keyword)
    where(["room_name like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
