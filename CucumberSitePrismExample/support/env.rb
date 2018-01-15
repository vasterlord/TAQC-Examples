require 'capybara'
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

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome
Capybara.current_driver = :chrome
 