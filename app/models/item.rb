class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping
  belongs_to :delivery_area
  belongs_to :delivery_day



  validates :genre_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :shipping_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :delivery_area_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :image, presence: true
end

