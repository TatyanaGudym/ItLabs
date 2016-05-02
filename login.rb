module Login
  def login
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:name, 'login').click
  end
end