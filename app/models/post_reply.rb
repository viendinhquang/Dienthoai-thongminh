class PostReply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post_comment
end
