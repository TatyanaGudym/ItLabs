module Logout

  def logout
    @driver.find_element(:class, 'logout').click
    @wait.until {@driver.find_element(:class, 'login').displayed? }
  end
end