class ResultPage
  def initialize(driver)
    @driver=driver
  end

  def title
    @driver.title
  end

end