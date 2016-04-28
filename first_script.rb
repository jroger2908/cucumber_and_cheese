require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :firefox

def adopt_puppy_number(browser, num)
  browser.button(:value => 'View Details', :index => num -1).click
  browser.button(:value => 'Adopt Me!').click
end

browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number(browser, 1)
browser.button(:value => 'Adopt Another Puppy').click
adopt_puppu_number(browser, 2)