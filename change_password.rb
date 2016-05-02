module ChangePassword
  def change_password
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:id, 'new_password').send_keys 'NewPassword1'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'NewPassword1'
    @driver.find_element(:name, 'commit').click
  end
end