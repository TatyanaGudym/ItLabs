module CreateProjectVersion
  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @wait.until {@driver.find_element(:link, 'New version').displayed?}
    @driver.find_element(:link, 'New version').click
    @wait.until {@driver.find_element(:id, 'version_name').displayed?}
    @new_version_name = ('newname' + rand(99999).to_s)
    @driver.find_element(:id, 'version_name').send_keys @new_version_name
    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:link, @new_version_name).displayed?}
  end

end