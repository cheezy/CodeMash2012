require_relative 'error_panel'

class CheckoutPage
  include PageObject
  include ErrorPanel

  DEFAULT_DATA = {
      'name' => Faker::Name.name,
      'address' => Faker::Address.street_address,
      'email' => Faker::Internet.email,
      'pay_type' => 'Check'
  }

  text_field(:name, :id => 'order_name')
  text_field(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')

  def complete_order(data = {})
    populate_page_with DEFAULT_DATA.merge(data)
    sleep 3
    place_order
  end

end