class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :purchase_record
end