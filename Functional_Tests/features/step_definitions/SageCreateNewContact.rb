require 'rubygems'
require 'cucumber'
require 'page-object'
require "watir"
require 'date'
require 'test/unit/assertions'
include Test::Unit::Assertions

Before do

end
Given(/^CC "([^"]*)" I login to Sage Website with "([^"]*)"$/) do |no,email|

  $testno = no

  $screen_name = 'Login Screen'

  page = 'login'
  $reusable_utilities.open(page)

  $reusable_utilities.login(email)
  $reusable_utilities.screenshot_capture($testno + ' ' + $screen_name + "Incorrect Login")

end

When(/^CC I select "([^"]*)" in the global navigation menu$/) do |option|

  case option
    when 'Contacts'
      @home_screen.contacts
  end

end

When(/^CC I select "([^"]*)"$/) do |contact_type|

$screen_name = 'Contacts Screen'

  case contact_type
    when 'Customer'
        @contact_screen.newCustomer
    when 'Supplier'
        @contact_screen.newSupplier
  end

end

When(/^CC I give "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |business_name,contact_name,reference,contact_email,mobile,telephone,address1,address2,city,country,postcode|

  @contact_screen.businessName = business_name
  @contact_screen.contactName = contact_name
  @contact_screen.reference = reference
  @contact_screen.email = contact_email
  @contact_screen.mobile = mobile
  @contact_screen.telephone = telephone
  @contact_screen.address1 = address1
  @contact_screen.address2 = address2
  @contact_screen.city = city
  @contact_screen.country = country
  @contact_screen.postcode = postcode

  @contact_screen.save

end

Then(/^CC I see the "([^"]*)"$/) do |output|

  case output
    when 'Contact Created'
      puts  "Contact Created Successfully"

    when 'Business Name is required'
      $reusable_utilities.screenshot_capture($testno + ' ' + $screen_name + "Business name is required")

    when 'Please enter valid email address'
      $reusable_utilities.screenshot_capture($testno + ' ' + $screen_name + "Invalid Email Address")

    when 'Reference must be unique'
      $reusable_utilities.screenshot_capture($testno + ' ' + $screen_name + "Refernece Error")
  end

  $browser.quit

end
