require_relative '../support/env.rb'  
require_relative '../tools/logger_wrapper.rb' 

class GooglePage < SitePrism::Page  
  attr_reader :logger, :founded_headers
  set_url "http://www.google.com"
  element :search_input, "//input[@name='q']" 
  element :search_button, "//input[@name='btnK']"  
  elements :search_results, "//h3[@class='r']" 

  def enter_search_data(search_text) 
    @logger = LoggerWrapper.logger    
    search_input.set search_text
  end 

   def click_search_button 
    search_button.click 
    logger.info 'Founded headers'
    search_results.each do |item| 
      puts item.text
    end 
    @founded_headers = search_results.size 
    @founded_headers
  end 
end
