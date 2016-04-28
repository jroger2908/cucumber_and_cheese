require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :firefox

browser.goto 'http://puppies.herokuapp.com'
browser.button(:value => 'View Details').click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Complete the Adoption').click
browser.text_field(:id => 'order_name').set('Cheezy')
browser.text_field(:id => 'order_address').set('123 Main St.')
browser.text_field(:id => 'order_email').set('cheezy@foo.com')
browser.select_list(:id => 'order_pay_type').set('Check')
browser.button(:value => 'Place Order').click
fail 'Browser text did not match expected value' unless browser.text.include?
      'Thank you for adopting a puppy!'