class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/ }
  end
  validates :delivery_area_id, numericality: { other_than: 0 , message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_cord: post_cord, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end