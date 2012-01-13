class ShoppingCartPage
  include PageObject

  ROWS_PER_PUPPY = 6
  SUBTOTAL_COLUMN = 3
  NAME_COLUMN = 1

  button(:adopt_another, :value => 'Adopt Another Puppy')
  button(:complete_adoption, :value => 'Complete the Adoption')
  table(:cart, :index => 0)
  cell(:cart_total, :class => 'total_cell')

  def name_for_line_item(line_item)
    cart_row_for(line_item)[NAME_COLUMN].text
  end

  def subtotal_for_line_item(line_item)
    cart_row_for(line_item)[SUBTOTAL_COLUMN].text
  end

  private

  def row_for(line_item)
    (line_item - 1) * ROWS_PER_PUPPY
  end

  def cart_row_for(line_item)
    cart_element[row_for(line_item)]
  end

end