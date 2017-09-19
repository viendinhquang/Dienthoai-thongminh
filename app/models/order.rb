class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :order_status
  before_create :set_order_status
  # before_validation :set_order_status, on: :create
  # before_save :update_subtotal

  def subtotal
    # binding.pry
    order_items.collect { |oi| oi.valid? ? (oi.quantity.to_i * oi.unit_price.to_i) : 0 }.sum
  end
  private
  def set_order_status
    # binding.pry
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
