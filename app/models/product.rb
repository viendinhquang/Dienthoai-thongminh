class Product < ActiveRecord::Base
  belong_to :producer
  belong_to :operating_systems
  belong_to :type_colors
end
