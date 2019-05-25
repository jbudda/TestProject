# Language: Ruby, Level: Level 3
require 'rubygems'
require 'cucumber'
require "watir"
require 'page-object'

class ReusableUtilities
  include PageObject

  def open(screen_name)
    $browser.goto $TEST_URL + screen_name
  end

  def login(user)
     $browser.text_field(:id => 'sso_Email').set user
     $browser.text_field(:id => 'sso_Password').set 'P@55w0rd'
     $browser.button(:type => 'submit').click
 end

  def screenshot_capture(screen_name)
    $browser.screenshot.save "output/screenshots/#{screen_name}.png"
  end

end
