module CreateNewProject

def create_new_project
  @driver.find_element(:class, 'projects').click
  @driver.find_element(:class, 'icon-add').click
  @driver.find_element(:id, 'project_name').send_keys 'Tatiana project'
  identifier = ('tanya' + rand(99999).to_s)
  @driver.find_element(:id, 'project_identifier').send_keys identifier
  @driver.find_element(:name, 'commit').click
end

  end