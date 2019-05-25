Feature: Create New Contacts

  Scenario Outline: Provide details to create new contacts
    Given CC "<no>" I login to Sage Website with "<email>"
    When CC I select "<option>" in the global navigation menu
    And CC I select "<contact_type>"
    And CC I give "<business_name>" "<contact_name>" "<reference>" "<contact_email>" "<mobile>" "<telephone>" "<address1>" "<address2>" "<city>" "<country>" "<postcode>"
    Then CC I see the "<output>"

    Examples:
    | no  | email                        | option   | contact_type | business_name    | contact_name | reference | contact_email      | mobile      | telephone    | address1 | address2      | city      | country | postcode | output                   |
    | TC1 | rstraavaldson@mailinator.com | Contacts | Customer     | TestCustomerName | Ruby         | TR01      | ruby.test@mail.com | 07813245671 | 0191 2312345 | 23       | garden avenue | Newcastle | UK      | NE1 1QA  | Customer Contact Created |
    | TC2 | rstraavaldson@mailinator.com | Contacts | Supplier     | TestSupplierName | Rose         | R102      | rose.test@mail.com | 08978678978 | 0191 2352345 | 19       | parker street | Glassgow  | UK      | G1 1PA   | Supplier Contact Created |
    | TC3 | rstraavaldson@mailinator.com | Contacts | Customer     | Interiors        |              |           |                    |             |              |          |               |           |         |          | Customer Contact Created |
    #Validations
    | TC4 | rstraavaldson@mailinator.com | Contacts | Supplier |          |  |        | testuser@email.com |  |  |  |  |  |  |  | Business Name is required        |
    | TC5 | rstraavaldson@mailinator.com | Contacts | Supplier | Pearls   |  |        | ghfdj              |  |  |  |  |  |  |  | Please enter valid email address |
    | TC6 | rstraavaldson@mailinator.com | Contacts | Customer | IronBars |  | TR1 |                    |  |  |  |  |  |  |  | Reference must be unique         |
    | TC7 | rstraavladson@gmail.com      |          |          |          |  |        |                    |  |  |  |  |  |  |  | Incorrect Login                  |
