module HelperMethods

  def create_new_project
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @wait.until {@driver.find_element(:id, 'new_project').displayed? }
    @driver.find_element(:id, 'project_name').send_keys 'Tatiana project'
    identifier = ('tanya' + rand(99999).to_s)
    @driver.find_element(:id, 'project_identifier').send_keys identifier
    @driver.find_element(:name, 'commit').click
  end

  def create_support
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue-form').displayed? }

    #@driver.find_element(:id, 'issue_tracker_id').click
    #@driver.find_element(:css,"option[value='3']").click

    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, 'issue_tracker_id'))
    select.select_by(:text, "Support")
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Support issue'
    @driver.find_element(:name, 'commit').click
  end

  def change_password
    @driver.find_element(:class, 'my-account').click
    @wait.until {@driver.find_element(:id, 'my_account_form').displayed? }
    @driver.find_element(:class, 'icon-passwd').click
    @wait.until {@driver.find_element(:css, '.controller-my.action-password').displayed? }
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:id, 'new_password').send_keys 'NewPassword1'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'NewPassword1'
    @driver.find_element(:name, 'commit').click
  end

  def create_bug_issue
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue-form').displayed? }
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Bug issue'
    @driver.find_element(:name, 'commit').click
  end

  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:css, '#tab-content-versions .icon-add').click
    @wait.until {@driver.find_element(:id, 'new_version').displayed?}
    @new_version_name = ('newname' + rand(99999).to_s)
    @driver.find_element(:id, 'version_name').send_keys @new_version_name
    @driver.find_element(:name, 'commit').click
  end

  def create_feature
    @driver.find_element(:class, 'new-issue').click
    @wait.until {@driver.find_element(:id, 'issue-form').displayed? }
    #@driver.find_element(:id, 'issue_tracker_id').click
    #@driver.find_element(:css,"option[value='2']").click
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, 'issue_tracker_id'))
    select.select_by(:text, "Feature")
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Feature issue'
    @driver.find_element(:name, 'commit').click
  end

  def login
    @driver.find_element(:class, 'login').click
    @wait.until {@driver.find_element(:id, 'login-form').displayed? }
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:name, 'login').click
  end

  def logout
    @driver.find_element(:class, 'logout').click
    @wait.until {@driver.find_element(:class, 'register').displayed? }
  end

  def register_user
    @driver.navigate.to 'http://demo.redmine.org'

    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'new_user').displayed? }

    @login = ('login' + rand(99999).to_s)
    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys 'Password1'
    @driver.find_element(:id, 'user_password_confirmation').send_keys 'Password1'
    @driver.find_element(:id, 'user_firstname').send_keys 'Firstname'
    @driver.find_element(:id, 'user_lastname').send_keys 'Lastname'
    @driver.find_element(:id, 'user_mail').send_keys (@login + '@testtest.com')
    @driver.find_element(:name, 'commit').click

  end
end