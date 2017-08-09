class SubCategory < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :posts, dependent: :destroy
  belongs_to :category
end
