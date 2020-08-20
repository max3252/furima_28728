class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  
  validates :name, :text, :image, :category, :status, :burden, :prefecture, :day, :price presence: true

  
  validates :category_id, :status_id, :burden_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 
 
end
