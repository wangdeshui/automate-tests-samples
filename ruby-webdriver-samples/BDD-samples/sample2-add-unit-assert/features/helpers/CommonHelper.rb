
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