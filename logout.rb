module Logout

  def logout
    @driver.find_element(:class, 'logout').click
  end
end