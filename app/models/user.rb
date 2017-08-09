class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :product_replies, dependent: :destroy
  has_many :post_replies, dependent: :destroy
  has_many :user_products
  has_many :products, through: :user_products
end
