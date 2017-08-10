class PostComment < ActiveRecord::Base
  has_many :post_replies, dependent: :destroy
  belongs_to :user
  belongs_to :post
end
