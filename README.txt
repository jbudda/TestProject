# TestProject
First GitHub Repository

# TestProject
First GitHub Repository

Selenium With Ruby Test Framework

Actions Performed:
- Login to Sage
- Navigate to COntacts using the global navigation menu
- Tests to creating contacts both positive and negative
- Written failed tests and captured screenshot
- generate test html report for both passed and failed tests

Command to run the test:
bundle exec cucumber -f pretty -f html -o output/reports/Create_Contacts_Results.html features/SageCreateNewCustomerContact.feature execution='local' browser='chrome'
