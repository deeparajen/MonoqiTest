require_relative File.expand_path(File.dirname(File.dirname(__FILE__))+'/src/checkout.rb') 
describe Checkout do
  # create an instance for SpecialOffer Class and Checkout Class
  let(:offer) { SpecialOfferRules.new }
  let(:checkout) { Checkout.new(offer) }
  #iterate and scan a each item on the cart
  let(:purchased_items) { Proc.new do |items|
    items.split(//).each { |item| checkout.scan(item) }
  end
}

  context "Items with no offer" do
    
   it "should return total as 0 for no products" do
    #scenerio : Doesn't place an order
    purchased_items.call("")
    expect(checkout.total_price).to eq 0
   end 
   
   it "should return total price 50 for A" do
    # scenerio 1 : Scan single item "A"
    purchased_items.call("A")
    expect(checkout.total_price).to eq 50
   end

   it "should return total price 80 for AB" do
     # scenerio 1 : Scan two different item "AB"
    purchased_items.call("AB")
    expect(checkout.total_price).to eq 80
  end
  
    it "should return total price 115 for CDBA" do
     # scenerio 1 : Scan dfferent item "CDBA"
     purchased_items.call("CDBA")
    expect(checkout.total_price).to eq 115
  end
  
  end
  
  context "Scan Same items with special offer" do
    it "should return 130 for AAA" do
      # Scenerio: Purchased Offered items 
      purchased_items.call("AAA")
      expect(checkout.total_price).to eq 130
    end
    
    it "should return 180 for AAAA" do
      purchased_items.call("AAAA")
      expect(checkout.total_price).to eq 180
    end
    
    it "should return 230 for AAAAA" do
      purchased_items.call("AAAAA")
      expect(checkout.total_price).to eq 230
    end
    
    it "should return 260 for AAAAAA" do
      purchased_items.call("AAAAAA")
      expect(checkout.total_price).to eq 260
    end
    
   end
  
  
   context "Scan different items with special offer" do
    it "should return 160 for AAAB" do
      purchased_items.call("AAAB")
      expect(checkout.total_price).to eq 160
    end
    
    it "should return 175 for AAABB" do
      purchased_items.call("AAABB")
      expect(checkout.total_price).to eq 175
    end
    
    it "should return 190 for AAABBD" do
      purchased_items.call("AAABBD")
      expect(checkout.total_price).to eq 190
    end
   end
  
end