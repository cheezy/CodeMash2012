class HomePage
  include PageObject

  page_url 'http://localhost:3000'

  def adopt
    button_element(:value => 'View Details').click
  end
end
