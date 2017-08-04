class SubCategory < ActiveRecord::Base
  belong_to :category, dependent: :destroy
end
