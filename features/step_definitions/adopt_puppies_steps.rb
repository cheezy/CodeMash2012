Given /^I am on the puppy adoption site$/ do
  visit_page(HomePage)
end

When /^I click the View Details button$/ do
  on_page(HomePage).adopt
end

When /^I click the Adopt Me button$/ do
  on_page(DetailsPage).adopt_me
end

When /^I click the Complete the Adoption button$/ do
  on_page(ShoppingCartPage).complete_adoption
end

When /^I enter "(.+)" in the name field$/ do |name|
  on_page(CheckoutPage).name = name
end

When /^I enter "(.+)" in the address field$/ do |address|
  on_page(CheckoutPage).address = address
end

When /^I enter "(.+)" in the email field$/ do |email|
  on_page(CheckoutPage).email = email
end

When /^I select "(.+)" from the pay type dropdown$/ do |pay_type|
  on_page(CheckoutPage).pay_type = pay_type
end

When /^I click the Place Order button$/ do
  on_page(CheckoutPage).place_order
end

Then /^I should see "(.+)"$/ do |expected|
  @current_page.text.should include expected
end

When /^I checkout using:$/ do |table|
  on_page(CheckoutPage).checkout(table.hashes.first)
end

When /^I checkout$/ do
  on_page(CheckoutPage).checkout
end

When /^I checkout using a Check$/ do
  on_page(CheckoutPage).checkout('pay_type' => 'Check')
end

When /^I complete the adoption of a puppy$/ do
  navigate_to(CheckoutPage).checkout
end

When /^I checkout leaving the name field blank$/ do
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then /^I should see the error message "(.+)"$/ do |message|
  @current_page.should have_error_message message
end
