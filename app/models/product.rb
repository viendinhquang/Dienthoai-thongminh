class Product < ActiveRecord::Base
  belongs_to :producer
  belongs_to :operating_system
  belongs_to :type_color
end
