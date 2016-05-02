module CreateProjectVersion
  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:link, 'New version').click
    @new_version_name = ('newname' + rand(99999).to_s)
    @driver.find_element(:id, 'version_name').send_keys @new_version_name
    @driver.find_element(:name, 'commit').click
  end

end