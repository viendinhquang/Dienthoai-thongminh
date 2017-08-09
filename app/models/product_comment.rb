class ProductComment < ActiveRecord::Base
  has_many :product_replies, dependent: :destroy
  belongs_to :user
  belongs_to :product
end
