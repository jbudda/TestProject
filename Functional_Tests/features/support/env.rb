Before do

  $TEST_URL = 'https://app.sageone.com/'

  # BROWSER & CAPABILITY INITIALISATIONS
  # ************************************
  case ENV['execution']   # Execution Settings
    when 'local'          # Local Machine execution
      case ENV['browser'] # Browser Initialisation
      when 'chrome'
        # 2 minute default wait for watir
        Watir.default_timeout = 120

        $browser = Watir::Browser.new :chrome
        $browsertype = 'CHR'

        $browser.window.maximize

      when 'chrome_headless'
        # 2 minute default wait for watir
        Watir.default_timeout = 120

        $browser = Watir::Browser.new :chrome, headless: true
        $browsertype = 'CHR'

        $browser.window.maximize

      when 'firefox'
        # 2 minute default wait for watir
        Watir.default_timeout = 120

        $browser = Watir::Browser.new :firefox
        $browsertype = 'FF'

        $browser.window.maximize

      when 'safari'
        # 2 minute default wait for watir
        Watir.default_timeout = 120

        $browser = Watir::Browser.new :safari
        $browsertype = 'SAF'

        $browser.driver.manage.window.maximize

      when 'opera'
        $browser = Watir::Browser.new :opera
        $browsertype = 'OP'

      end

    end



    ##############################################################################################

  # Initialisation of all libraries and screens to be used in the scripts
  $reusable_utilities = ReusableUtilities.new($browser)
  @home_screen = SageOneHomeScreen.new($browser)
  @login_screen = SageLoginScreen.new($browser)
  @contact_screen = NewContactScreen.new($browser)
  @delete_customer_screen = DeleteCustomerScreen.new($browser)
end
