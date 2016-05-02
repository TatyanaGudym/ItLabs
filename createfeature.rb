module CreateFeature
  def create_feature
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css,"option[value='2']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Feature issue'
    @driver.find_element(:name, 'commit').click
  end
end