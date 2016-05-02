module CreateSupport

  def create_support
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css,"option[value='3']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Support issue'
    @driver.find_element(:name, 'commit').click
  end
end