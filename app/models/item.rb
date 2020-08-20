class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  validates :name, :text, :image, :category, :status, :burden, :prefecture, :day, :price, presence: true
  
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id  
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end
 
  validates :price, numericality: { greater_than: 300, less_than: 9999999, message: 'Out of setting range' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

end
