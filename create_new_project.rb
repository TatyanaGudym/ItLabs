module CreateNewProject

def create_new_project
  @driver.find_element(:class, 'projects').click
  @wait.until {@driver.find_element(:class, 'icon-add').displayed? }
  @driver.find_element(:class, 'icon-add').click
  @wait.until {@driver.find_element(:id, 'project_name').displayed? }
  @driver.find_element(:id, 'project_name').send_keys 'Tatiana project'
  identifier = ('tanya' + rand(99999).to_s)
  @driver.find_element(:id, 'project_identifier').send_keys identifier
  @driver.find_element(:name, 'commit').click
  @wait.until {@driver.find_element(:id, 'flash_notice').displayed? }
end

  end