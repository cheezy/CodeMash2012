require 'rspec-expectations'
require 'page-object'
require 'page-object/page_factory'

require 'faker'
require 'require_all'

=begin
require_all File.dirname(__FILE__) + '/pages'

PageObject::PageFactory.routes = {
  :default => [[HomePage, :adopt],
               [DetailsPage, :adopt_me],
               [ShoppingCartPage, :complete_adoption],
               [CheckoutPage, :checkout]],
}
=end

World(PageObject::PageFactory)

