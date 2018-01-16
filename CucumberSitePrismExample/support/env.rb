require 'capybara'  
require "rspec" 
require "rspec/expectations" 
require 'selenium-webdriver'
require 'site_prism'
require 'test_site' 
require 'capybara/dsl'
 
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1920,1080") 
  Selenium::WebDriver::Chrome.driver_path = "lib/chromedriver.exe"
  Capybara::Selenium::Driver.new(app,
    browser: :chrome, 
    options: options 
  )
end 
 
Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1920,1080") 
  options.add_argument('--headless')  
  Selenium::WebDriver::Chrome.driver_path = "lib/chromedriver.exe"
  Capybara::Selenium::Driver.new(app,
    browser: :chrome, 
    options: options 
  )
end  

Capybara.register_driver :firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument("--window-size=1920,1080") 
  Selenium::WebDriver::Firefox.driver_path = "lib/geckodriver.exe"
  Capybara::Selenium::Driver.new(app,
    browser: :firefox, 
    options: options 
  )
end 
 
Capybara.register_driver :headless_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument("--window-size=1920,1080") 
  options.add_argument('--headless')  
  Selenium::WebDriver::Firefox.driver_path = "lib/geckodriver.exe"
  Capybara::Selenium::Driver.new(app,
    browser: :firefox, 
    options: options 
  )
end 
 
Capybara.configure do |config|
  Capybara.default_driver = :firefox
  Capybara.javascript_driver = :headless_firefox
  Capybara.current_driver = :firefox
  config.run_server = false
  config.default_selector = :xpath
  config.default_max_wait_time = 5
end 