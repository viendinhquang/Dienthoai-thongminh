class Post < ActiveRecord::Base
  # Paperclip
  # has_attached_file :image,
  #   :styles => {
  #     :thumb => "100x100#",
  #     :small  => "150x150>",
  #     :medium => "200x200" }
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  belongs_to :sub_category
  mount_uploader :image, PictureUploader
end
