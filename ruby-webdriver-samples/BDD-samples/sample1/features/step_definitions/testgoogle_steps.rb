require 'rubygems'
require 'selenium-webdriver'

require_relative '../page_objects/homepage'
require_relative '../page_objects/resultpage'
require_relative '../helpers/CommonHelper'

include CommonHelper

Given(/^I am in google home page$/) do
  @driver=driver
  @homepage=HomePage.new(@driver)
  @homepage.open

  #test if unit test assert can use
  assert 1<2

end

Given(/^I have input "(.*?)"$/) do |arg1|

  @homepage.search_field.send_keys "Hana!"

  puts "Page title is #{@homepage.title}"


end

When(/^I click Submit$/) do
  @homepage.submit
end

Then(/^the page result should include "(.*?)"$/) do |arg1|
  result_page=ResultPage.new(@driver)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  #verify { assert element_present?(:css, "td.table5 > span.style1") }
  #assert !60.times{ break if (element_present?(:css, "anElement") rescue false); sleep 1 }
  wait_till { result_page.title.downcase.start_with? "hana!" }

  puts "Page title is #{result_page.title}"
  @driver.quit
end