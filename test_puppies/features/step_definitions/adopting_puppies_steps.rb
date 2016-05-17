Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end

When(/^I click the View Details button$/) do
  on(HomePage).select_puppy_number 1
end

And(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart
end

And(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end

And(/^I enter "([^"]*)" in the name field$/) do |name|
  on(CheckoutPage).name = name
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  on(CheckoutPage).address = address
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
  on(CheckoutPage).email = email
end

And(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

And(/^I click the Place Order button$/) do
  on(CheckoutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |message|
   expect(on(CheckoutPage).text).to include(message)
end

And(/^I click the Adopt Another Puppy button$/) do
  @cart.continue_shopping
end

And(/^I click the second View Details button$/) do
  @home.select_puppy_number 2
  @details = DetailsPage.new(@browser)
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include name
end

And(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)).to eql subtotal
end

And(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(on(ShoppingCartPage).cart_total).to eql total
end

def row_for(line_item)
  (line_item - 1) * 6
end

def cart_line_item(line_item)
  @browser.table(:index => 0)[row_for(line_item)]
end