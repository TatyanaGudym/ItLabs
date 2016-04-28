require 'test/unit'
require 'selenium-webdriver'

class TestRegistration < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_registration
    register_user
    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

   def test_logout
     register_user
     @driver.find_element(:class, 'logout').click
     sleep 3
     login_button = @driver.find_element(:class, 'login')
     assert (login_button.displayed?)
   end

  def test_login
    test_logout
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:name, 'login').click
    logout_button = @driver.find_element(:class, 'logout')
    assert (logout_button.displayed?)
  end

  def test_change_password
    register_user
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, 'password').send_keys 'Password1'
    @driver.find_element(:id, 'new_password').send_keys 'NewPassword1'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'NewPassword1'
    @driver.find_element(:name, 'commit').click
    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_new_project
    register_user
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    @driver.find_element(:id, 'project_name').send_keys 'Tatiana project'
    identifier = ('tanya' + rand(99999).to_s)
    @driver.find_element(:id, 'project_identifier').send_keys identifier
    @driver.find_element(:name, 'commit').click
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

def test_create_project_version
  test_create_new_project
  @driver.find_element(:id, 'tab-versions').click
  @driver.find_element(:link, 'New version').click
  new_version_name = ('newname' + rand(99999).to_s)
  @driver.find_element(:id, 'version_name').send_keys new_version_name
  @driver.find_element(:name, 'commit').click
  assert{@driver.find_element(:link, new_version_name).displayed?}
end

  def test_create_bug_issue
    test_create_new_project
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Bug issue'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link, 'View all issues').click
    assert{@driver.find_element(:link, 'This is new Bug issue').displayed?}
  end

  def test_create_feature
    test_create_new_project
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css,"option[value='2']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Feature issue'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link, 'View all issues').click
    assert{@driver.find_element(:link, 'This is new Feature issue').displayed?}
  end

  def test_create_support
    test_create_new_project
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').click
    @driver.find_element(:css,"option[value='3']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'This is new Support issue'
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link, 'View all issues').click
    assert{@driver.find_element(:link, 'This is new Support issue').displayed?}
  end

  def register_user
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed? }
    @login = ('login' + rand(99999).to_s)
    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys 'Password1'
    @driver.find_element(:id, 'user_password_confirmation').send_keys 'Password1'
    @driver.find_element(:id, 'user_firstname').send_keys 'Firstname'
    @driver.find_element(:id, 'user_lastname').send_keys 'Lastname'
    @driver.find_element(:id, 'user_mail').send_keys (@login + '@testtest.com')
    @driver.find_element(:name, 'commit').click
    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def teardown
  @driver.quit
  end
  
end
