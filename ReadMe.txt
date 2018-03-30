Test Case - Pricing Rules

1)Have implemented the test cases on Rspec testing framework.
2)Executable Solution to run the test suite.
 Have created the Rakefile to run the specs task(checkout)
 Navigate to root project directory and type the following command
 rake checkout
	
	OR

	rspec spec/checkout_spec.rb

3)Have implement Observer design pattern. The logic behind the observer pattern when any changes made on quantity will invoke the Rules to check that particular SKU’s having any discount or special offers at that time.
For every scanned SKU item have a check with offer rules. If so then  we marked that SKU’s with discount price.
4)Finally iterate and calculate an SKU’s item with its quantity,unit price and discount price.
Followed OOPs Principle with Observer Design Pattern