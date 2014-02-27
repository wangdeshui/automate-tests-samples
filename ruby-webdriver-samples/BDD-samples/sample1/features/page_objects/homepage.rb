
class HomePage
  def initialize(driver)
    @driver=driver
  end

  def search_field
    @driver.find_element :name => "q"
  end

  def submit
    search_field.submit
  end

  def title
    @driver.title
  end

  def open
    @driver.get "http://google.com"
    self
  end
end