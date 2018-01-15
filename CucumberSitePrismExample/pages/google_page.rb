require_relative '../support/env.rb'  
require_relative '../tools/logger_wrapper.rb' 

class GooglePage < SitePrism::Page
   set_url "http://www.google.com" 

   element :search_input, "//input[@name='q']" 
   element :search_button, "//input[@name='btnK']" 

  def search_data(search_text)   
    search_input.set search_text 
    search_button.click 
    LoggerWrapper.info 'Data searching...' 
    puts search_text 
    quit
  end 
end 
 
page = GooglePage.new 
page.load 
page.search_data('data')