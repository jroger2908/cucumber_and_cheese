require 'rubygems'
require 'watir-webdriver'
@browser = Watir::Browser.new :firefox

def adopt_puppy_number(num)
  @browser.button(:value => 'View Details', :index => num -1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

@browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number(1)
continue_adopting_puppies
adopt_puppu_number(2)