class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :purchase_record

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :delivery_area_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :post_cord
    validates :municipality
    validates :address
    validates :phone_number
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_cord: post_cord, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, phone_number:, phone_number, purchase_record_id: purchase_record_id)
end