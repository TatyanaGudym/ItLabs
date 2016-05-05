module CreateFeature
  def create_feature
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue_tracker_id').displayed? }
    #@driver.find_element(:id, 'issue_tracker_id').click
    #@driver.find_element(:css,"option[value='2']").click
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, 'issue_tracker_id'))
    #@wait.until {@driver.find_element(:text, "Feature").displayed? }
    select.select_by(:text, "Feature")
    @wait.until {@driver.find_element(:id, 'issue_subject').displayed? }
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Feature issue'
    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:link, 'View all issues').displayed?}
  end
end