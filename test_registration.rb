require 'test/unit'
require 'selenium-webdriver'
require_relative 'registration'
require_relative 'create_new_project'
require_relative 'logout'
require_relative 'login'
require_relative 'change_password'
require_relative 'create_project_version'
require_relative 'create_bug_issue'
require_relative 'createfeature'
require_relative 'create_support'


class TestRegistration < Test::Unit::TestCase
  include Registration
  include CreateNewProject
  include Logout
  include Login
  include ChangePassword
  include CreateProjectVersion
  include CreateBugIssue
  include CreateFeature
  include CreateSupport

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
     logout
     login_button = @driver.find_element(:class, 'login')
     assert (login_button.displayed?)
   end

  def test_login
    test_logout
    login
    logout_button = @driver.find_element(:class, 'logout')
    assert(logout_button.displayed?)
  end

  def test_change_password
    register_user
    change_password
    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_new_project
    register_user
    create_new_project
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

def test_create_project_version
  test_create_new_project
  create_project_version
  assert(@driver.find_element(:link, @new_version_name).displayed?)
end

  def test_create_bug_issue
    test_create_new_project
    create_bug_issue
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Bug issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Bug issue').displayed?)
  end


  def test_create_feature
    test_create_new_project
    create_feature
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Feature issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Feature issue').displayed?)
  end

  def test_create_support
    test_create_new_project
    create_support
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Support issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Support issue').displayed?)
  end


  def teardown
  @driver.quit
  end
  
end