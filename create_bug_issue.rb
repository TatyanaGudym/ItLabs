module CreateBugIssue
  def create_bug_issue
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue_subject').displayed? }
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Bug issue'
    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:link, 'View all issues').displayed? }
  end
end