module ErrorPanel
  include PageObject
  
  div(:error_div, :id => 'error_explanation')
  unordered_list(:error_list) do |page|
    page.error_div_element.unordered_list_element
  end

  def error_messages
    error_list_element.text
  end

end
