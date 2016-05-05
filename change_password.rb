module ChangePassword
  def change_password
    @driver.find_element(:class, 'my-account').click
    @wait.until {@driver.find_element(:class, 'icon-passwd').displayed? }
    @driver.find_element(:class, 'icon-passwd').click
    @wait.until {@driver.find_element(:id, 'password').displayed? }
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:id, 'new_password').send_keys 'NewPassword1'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'NewPassword1'
    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:id, 'flash_notice').displayed? }
  end
end