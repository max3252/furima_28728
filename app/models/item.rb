class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id  
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end
 

  validates :name, :text, :image, :category, :status, :burden, :prefecture, :day, presence: true

  validates :price, numericality: { greater_than: 300, message: 'Out of setting range' }
  validates :price, numericality: { less_than: 9999999, message: 'Out of setting range' } 
  
end
