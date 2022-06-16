class Reservation < ApplicationRecord
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :people_number, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validate :start_finish_check

  belongs_to :user
  belongs_to :event

  private

  def start_finish_check
    errors.add(:ended_at, "は予約開始日より後の日付を選択してください") if started_at > ended_at
  end


end
