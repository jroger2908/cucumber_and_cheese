Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
  @home = HomePage.new(@browser)
end

When(/^I click the View Details button$/) do
  on(HomePage).select_puppy_number 1
end

And(/^I click the Adopt Me button$/) do
  @details.add_to_cart
  @cart = ShoppingCartPage.new(@browser)
end

And(/^I click the Complete the Adoption button$/) do
  @cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

And(/^I enter "([^"]*)" in the name field$/) do |name|
  @checkout.name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  @checkout.address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
  @checkout.email = email
end

And(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  @checkout.pay_type = pay_type
end

And(/^I click the Place Order button$/) do
  @checkout.place_order
end

Then(/^I should see "([^"]*)"$/) do |message|
   expect(@browser.text).to include(message)
end

And(/^I click the Adopt Another Puppy button$/) do
  @cart.continue_shopping
end

And(/^I click the second View Details button$/) do
  @home.select_puppy_number 2
  @details = DetailsPage.new(@browser)
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  expect(@cart.name_for_line_item(line_item.to_i)).to include name
end

And(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  expect(@cart.subtotal_for_line_item(line_item.to_i)).to eql subtotal
end

And(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(@cart.cart_total).to eql total
end

def row_for(line_item)
  (line_item - 1) * 6
end

def cart_line_item(line_item)
  @browser.table(:index => 0)[row_for(line_item)]
end