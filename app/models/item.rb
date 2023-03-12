class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping
  belongs_to :delivery_area
  belongs_to :delivery_day


  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :shipping_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :delivery_area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :price, presence: true
  
end

