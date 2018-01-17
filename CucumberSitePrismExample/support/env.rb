require "rspec" 
require "rspec/expectations" 
require 'fileutils'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'test_site' 
require 'capybara/dsl'  
require 'pry'
 
Capybara.register_driver :selenium_chrome do |app|
    #
    # Chrome's sandboxing doesn't work in a docker container because Chrome detects it's on an SID volume
    # and refuses to start. So you must either run the docker container w/--privileged or run chrome as
    # a non-root user with sandboxing disabled. The later seems most secure
    args = %w(--no-sandbox)
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :args => ["--no-sandbox", "--ignore-certificate-errors"])
end

Capybara.register_driver :selenium_geckodriver do |app|
    Capybara::Selenium::Driver.new(
        app,
        browser: :firefox, 
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox( 
          { marionette: false } 
        )
    )
end
  
#
# Register poltergeist (headless driver based on phantomjs)
Capybara.register_driver :poltergeist do |app|
    options = {
      :ignore_ssl_errors => true,
        :js_errors => false,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false', '--ignore-ssl-errors=true'],
        :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
end 

Capybara.configure do |config|
  Capybara.default_driver = :selenium_geckodriver
  Capybara.javascript_driver = :poltergeist
  Capybara.current_driver = :poltergeist
  config.run_server = false
  config.default_selector = :xpath
  Capybara.default_wait_time = 10 
  Capybara.current_session.driver.browser.manage.window.resize_to(1000,700)
end 