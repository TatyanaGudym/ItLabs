module CreateBugIssue
  def create_bug_issue
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Bug issue'
    @driver.find_element(:name, 'commit').click
  end
end