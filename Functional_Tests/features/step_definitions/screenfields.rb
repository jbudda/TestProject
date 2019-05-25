# Language: Ruby, Level: Level 3
require 'rubygems'
require 'cucumber'
require "watir"
require 'page-object'
require 'test/unit/assertions'
include Test::Unit::Assertions
require 'nokogiri'

class SageLoginScreen
  include PageObject

  text_field(:emailId, id: 'sso_Email')
  text_field(:pwd, id: 'sso_Password')
  button(:login, type: 'submit')
end

class SageOneHomeScreen
    include PageObject

    link(:contacts, href: '/contacts/contacts')
end

class NewContactScreen
  include PageObject
  link(:newCustomer, text: 'New Customer')
  link(:newSupplier, text: 'New Supplier')
  text_field(:businessName, name: 'contact[company]')
  text_field(:contactName, name: 'contact[addresses_attributes][0][contacts_attributes][0][name]')
  text_field(:reference, name: 'contact[reference]')
  text_field(:email, name: 'contact[addresses_attributes][0][contacts_attributes][0][email]')
  text_field(:mobile, name: 'contact[addresses_attributes][0][contacts_attributes][0][mobile]')
  text_field(:telephone, name: 'contact[addresses_attributes][0][contacts_attributes][0][telephone]')
  text_field(:address1, name: 'contact[addresses_attributes][0][line_1]')
  text_field(:address2, name: 'contact[addresses_attributes][0][line_2]')
  text_field(:city, name: 'contact[addresses_attributes][0][line_3]')
  text_field(:country, name: 'contact[addresses_attributes][0][line_4]')
  text_field(:postcode, name: 'contact[addresses_attributes][0][postcode]')
  button(:save, class: 'carbon-button carbon-button--primary carbon-button--blue carbon-button--medium carbon-form-save__button')

end

class DeleteCustomerScreen
  include PageObject
  text_field(:searchContact, name: 'filter[search_text]')
  button(:searchButton, xpath: "//button[@name='submit']")
  td(:searchContactName, value: 'aman')
  checkbox(:checkContact, value: 'searchContactName')
  button(:deleteContact, text: 'Yes')
  span(:searchCount, value: '0')

end
