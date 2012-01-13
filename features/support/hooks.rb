require 'watir-webdriver'


Before do
  @browser = Watir::Browser.new :firefox
  @browser.driver.manage.timeouts.implicit_wait = 3
end

After do
  @browser.close
end
