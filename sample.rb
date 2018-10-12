require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path="/Users/heera/Documents/Practise/projects/demo_selenium_ruby/drivers/chromedriver"
driver = Selenium::WebDriver.for :chrome

driver.navigate.to "https://www.propertyfinder.ae/"
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until {driver.find_element(:class => "useravatar_icon-loggedout")}
driver.find_element(:class, 'useravatar_icon-loggedout').click

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until {driver.find_element(:xpath => '//div[@class="authentication_inputarea"]/input[@type="text"]')}
driver.find_element(:xpath, '//div[@class="authentication_inputarea"]/input[@type="text"]').clear
driver.find_element(:xpath, '//div[@class="authentication_inputarea"]/input[@type="text"]').send_keys("heera@propertyfinder.ae")

driver.find_element(:xpath, '//input[@type="password"]').clear
driver.find_element(:xpath, '//input[@type="password"]').send_keys("test")
driver.find_element(:xpath, '//button[@class="button authentication_button"]').click

wait = Selenium::WebDriver::Wait.new(:timeout => 5)
begin
  wait.until {driver.find_element(:class => "useravatar_icon-loggedin")}
  sleep(3)
ensure
  driver.quit
end