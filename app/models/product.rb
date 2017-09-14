class Product < ActiveRecord::Base
  has_many :type_colors, dependent: :destroy
  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products
  has_many :product_comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  belongs_to :producer
  belongs_to :operating_system
  belongs_to :sub_category
end
