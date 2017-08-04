class Product < ActiveRecord::Base
  belongs_to :producer
  belongs_to :operating_systems
  belongs_to :type_colors
end
