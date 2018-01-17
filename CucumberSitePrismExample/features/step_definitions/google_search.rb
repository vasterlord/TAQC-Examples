require_relative '../../pages/google_page.rb' 

Given(/^I have started google "(.*?)"$/) do |arg1| 
@page = GooglePage.new 
@page.load  
end 

When(/^I entered "(.*?)" in search field$/) do |arg1|  
@page.enter_search_data(arg1) 
end  
 
And(/^I clicked in "(.*?)"$/) do |arg1|   
@page.click_search_button
end

Then(/^Should more than (\d+) result headers$/) do |arg1|   
expect(@page.founded_headers).to be >= arg1.to_i
end