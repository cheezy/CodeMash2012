require_relative 'error_panel'
require_relative 'side_panel'

class HomePage
  include PageObject
  include ErrorPanel

  NAME_LOOKUP = {
      'Brook' => 0,
      'Hanna' => 1
  }

  page_url "http://localhost:3000"

  def adopt(name = "Brook")
    button_element(:value => 'View Details', :index => index_for(name)).click
  end

  private

  def index_for(name)
    NAME_LOOKUP[name]
  end

end