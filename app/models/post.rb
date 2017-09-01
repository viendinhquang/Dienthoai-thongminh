class Post < ActiveRecord::Base
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :sub_category
  belongs_to :category
  mount_uploader :image, PictureUploader
end
