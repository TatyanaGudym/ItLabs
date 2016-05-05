module CreateSupport

  def create_support
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue_tracker_id').displayed? }

    #@driver.find_element(:id, 'issue_tracker_id').click
    #@driver.find_element(:css,"option[value='3']").click

    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, 'issue_tracker_id'))
    select.select_by(:text, "Support")
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Support issue'
    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:link, 'View all issues').displayed? }
  end
end