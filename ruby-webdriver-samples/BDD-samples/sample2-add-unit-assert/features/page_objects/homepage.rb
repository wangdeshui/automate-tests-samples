
class HomePage<BasePage

  def initialize(driver)
    @driver=driver
  end

  def search_field
    @driver.find_element :name => "q"
  end


  def test_assert
    assert 1<2, "1 not great 2"
  end

  def test_fail
    assert 1>2, "testing fail"
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