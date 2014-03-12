require 'test/unit'
require 'test/unit/assertions'
require 'rubygems'
require 'selenium-webdriver'

World(Test::Unit::Assertions)

module CommonHelper
  def wait_till(&block)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait until yield
  end

  def driver
    Selenium::WebDriver.for :firefox
  end

  def element_present?(how, what)
    driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

end


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
        self.execute_script('$(tag+"["+attribute+"|='"+prefix+"']")')
    end


end


