
require 'rubygems'
require 'selenium-webdriver'
require_relative "jQuery_Selector"

@driver=Selenium::WebDriver.for :firefox

select_file = 'file:///'.concat File.expand_path(File.join(File.dirname(__FILE__), 'sample.html'))
@driver.navigate.to select_file
#@driver.find_element_attribute_prefix("input","data-name","wow").first.send_keys "Good boy"

jq = <<JQ

       return $("input[href|='b']").text("aa");
JQ

@driver.execute_script(jq)
#@driver.execute_script("$(\"input\").hide();")

