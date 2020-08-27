class AddressBuy

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_num, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address_line1, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "Input correctly"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_num: phone_num, buy_id: buy.id)
  end
end

