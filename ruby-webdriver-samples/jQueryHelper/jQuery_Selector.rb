require 'rubygems'
require 'selenium-webdriver'

module Selenium::WebDriver
  Element.module_eval do
    def send_text(value)
      self.clear
      self.send_keys value+"aa"
    end
  end
end

class Selenium::WebDriver::Driver

  def find_element_attribute_prefix(tag,attribute, prefix)
    #self.execute_script("alert('haha')")

    self.execute_script("$(input[data|='wow'])").first.send_keys "haha"

    #self.execute_script('return $(tag+"["+attribute+"|='"+prefix+"']");')
  end


end