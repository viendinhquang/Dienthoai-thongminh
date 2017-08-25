class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, PictureUploader
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :product_replies, dependent: :destroy
  has_many :post_replies, dependent: :destroy
  has_many :user_products
  has_many :products, through: :user_products
  validates :name,  presence: true, length: { maximum: 50, message: 'Must be less than 50 characters'}
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
