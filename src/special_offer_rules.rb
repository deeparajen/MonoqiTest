class SpecialOfferRules
  
  def update(oitem)
    ### listen to the changes on quantity
    # 
    if oitem.sku == "A" && oitem.quantity == 3
        oitem.discount_price +=  (3 * oitem.unit_price.to_i - 20)
        oitem.quantity = 0
    elsif oitem.sku == "B" && oitem.quantity == 2
        oitem.discount_price += (2 * oitem.unit_price.to_i - 15)
        oitem.quantity = 0
    end
  end
end
