class ProductReply < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_comment
end
