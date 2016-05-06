require 'test/unit'
require 'selenium-webdriver'
require_relative 'HelperMethods'

class TestRegistration < Test::Unit::TestCase
  include HelperMethods

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
    register_user
    logout
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
  register_user
  create_new_project
  create_project_version
  assert(@driver.find_element(:link, @new_version_name).displayed?)
end

  def test_create_bug_issue
    register_user
    create_new_project
    create_bug_issue
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Bug issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Bug issue').displayed?)
  end


  def test_create_feature
    register_user
    create_new_project
    create_feature
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Feature issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Feature issue').displayed?)
  end

  def test_create_support
    register_user
    create_new_project
    create_support
    @driver.find_element(:link, 'View all issues').click
    @wait.until {@driver.find_element(:link, 'This is new Support issue').displayed? }
    assert(@driver.find_element(:link, 'This is new Support issue').displayed?)
  end

  def teardown
  @driver.quit
  end
  
end