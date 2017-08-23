class TypeColor < ActiveRecord::Base
  belongs_to :product
  mount_uploader :picture, PictureUploader
  validates_processing_of :picture
  validate :picture_size_validation

  private
  def picture_size_validation
    errors[:picture] << "should be less than 1000KB" if picture.size > 1.megabytes
  end
end

