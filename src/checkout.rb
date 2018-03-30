require_relative 'item'
require_relative 'order_item'
require_relative 'special_offer_rules'

class Checkout
  attr_reader :items,:order_items,:offers
  attr_accessor :total

  def initialize(offers)
    @items = {}
    @order_items ={}
    @total = 0.0
    @offers = offers
    load_products
  end
  
   def load_products
    #### Load the Products and its unit price
    add_product("A", "A", 50)
    add_product("B", "B", 30)
    add_product("C", "C", 20)
    add_product("D", "D", 15)
   end
  
   def add_product(sku, name, price)
    items[sku] = Item.new(sku, name, price)
  end

  def scan(sku)
    item = items[sku]
    oitem = OrderItem.new(item.sku,item.price)
    ##### Observer Pattern ###########
    # initiate the observer when there is a change on quantity
    oitem.add_observer(@offers)  
    order_items[item.sku] ||= oitem
    # increase the count of a quantity for same sku
    order_items[item.sku].quantity +=1  
  end

  def total_price
    ### iterate the order_items with key value pair
    order_items.each do |sku,item|
      # calculate the final price with discount rates
      @total += (item.quantity * item.unit_price) + item.discount_price
    end
    @total.to_i
  end
end

