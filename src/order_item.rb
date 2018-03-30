require_relative 'observer'

class OrderItem
  ### Mixin ###
  include Observer
  
  attr_reader :sku
  attr_accessor :quantity, :unit_price,:discount_price

  def initialize(sku, price)
    super()
    @sku = sku
    @unit_price = price
    @quantity=0
    @discount_price = 0
  end
  
  def quantity=(new_quantity)
    @quantity = new_quantity
    ##### Observer Pattern ###########
    notify_observers if @quantity > 1
  end
  
  
end