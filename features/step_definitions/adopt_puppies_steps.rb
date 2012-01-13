Given /^I am on the puppy adoption site$/ do
  visit_page(HomePage)
end

When /^I press the View Details button for "(.*)"$/ do |name|
  on_page(HomePage).adopt name
end

When /^I press the Adopt Me button$/ do
  on_page(DetailsPage).adopt_me
end

When /^I press the Adopt Another Puppy button$/ do
  on_page(ShoppingCartPage).adopt_another
end

When /^I press the Complete the Adoption button$/ do
  on_page(ShoppingCartPage).complete_adoption
end

When /^I enter "(.+)" in the name field$/ do |name|
  on_page(CheckoutPage).name = name
end

When /^I enter "([^"]*)" in the address field$/ do |address|
  on_page(CheckoutPage).address = address
end

When /^I enter "([^"]*)" in the email field$/ do |email|
  on_page(CheckoutPage).email = email
end

When /^I select "([^"]*)" from the pay type dropdown$/ do |pay_type|
  on_page(CheckoutPage).pay_type = pay_type
end

When /^I press the Place Order button$/ do
  on_page(CheckoutPage).place_order
end

Then /^I should see "([^"]*)"$/ do |expected|
  @current_page.text.should include expected
end

Then /^I should see "([^"]*)" for the name on (line item \d+)$/ do |name, line_item|
  on_page(ShoppingCartPage).name_for_line_item(line_item).should include name
end

When /^I should see "(.+)" as the subtotal for (line item \d+)$/ do |subtotal, line_item|
  on_page(ShoppingCartPage).subtotal_for_line_item(line_item).should == subtotal
end

When /^I should see "([^"]*)" as the shopping cart total$/ do |total|
  on_page(ShoppingCartPage).cart_total.should == total
end

When /^I checkout with$/ do |table|
  on_page(CheckoutPage).complete_order(table.hashes.first)
end

When /^I checkout using a Credit card$/ do
  on_page(CheckoutPage).complete_order('pay_type' => 'Credit card')
end

When /^I checkout using default data$/ do
  on_page(CheckoutPage).complete_order
end

When /^I complete the adoption of a puppy$/ do
  navigate_to(DetailsPage).adopt_me
  puts @current_page
  continue_navigation_to(CheckoutPage).complete_order
end

When /^I checkout leaving the (.+) blank$/ do |field|
  navigate_to(CheckoutPage) do |page|
    page.complete_order(field.downcase => '')
  end
end

Then /^I should see the error message "([^"]*)"$/ do |message|
  @current_page.should have_error_message message
end

Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  order = Factory.create(:order, :name => name)
  Factory.create(:adoption, :order => order)
end

When /^I process that adoption$/ do
  visit_page(LandingPage)
  on_page(LoginPage).login_to_system
  on_page(LandingPage).adoptions
  @timestamp_before_processing = Time.now
  on_page(ProcessPuppyPage).process_first_puppy
end

Then /^I should have the delivered on date set to today$/ do
  delivered_on = Adoption.first.delivered_on
  now = Time.now
  delivered_on.should > @timestamp_before_processing
  delivered_on.should < (now - now.gmt_offset).getlocal
end
