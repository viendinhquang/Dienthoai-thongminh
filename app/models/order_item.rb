class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  # before_save :finalize


  def unit_price
    # binding.pry
    # if persisted?
    unless persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    binding.pry
    unit_price * quantity
  end
  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  # def finalize
  #   binding.pry
  #   self[:unit_price] = unit_price
  #   self[:total_price] = quantity * self[:unit_price]
  # end
end
