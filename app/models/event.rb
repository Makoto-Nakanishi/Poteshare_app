class Event < ApplicationRecord
    has_many :reservations
    belongs_to :user

      # 1対１(単数枚画像投稿)で関連付けるという宣言
  has_one_attached :image

  def self.search(keyword)
    where(["room_name like?", "%#{keyword}%"])
  end

end
