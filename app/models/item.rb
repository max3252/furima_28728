class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :burden, :prefecture, :days

  
  validates :title, :text, :category, :status, :burden, :prefecture, :days, presence: true

  
  validates :category_id, :status_id, :burden_id, :purefecture_id, :days_id, numericality: { other_than: 1 } 
 
end
