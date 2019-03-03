require 'cucumber/rails'
require 'webmock/cucumber'
WebMock.allow_net_connect!
require 'coveralls'
Coveralls.wear_merged!('rails')

World(FactoryBot::Syntax::Methods)

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }

Chromedriver.set_version '2.42'

chrome_options = %w[headless disable-popup-blocking disable-infobars]

chrome_options << 'auto-open-devtools-for-tabs'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: chrome_options
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Cucumber::Rails::Database.javascript_strategy = :truncation
Capybara.server = :puma
Capybara.javascript_driver = :chrome

Before '@api_call' do 
  WebMock.disable_net_connect!(allow_localhost: true)
    stub_request(:get, "http://api.openweathermap.org/data/2.5/forecast/?APPID=9f17e0746e709d22e5f04a5160c8abc2&lang=en&q=Stockholm,se").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip, deflate',
      'Host'=>'api.openweathermap.org',
      'User-Agent'=>'rest-client/2.0.2 (darwin18.2.0 x86_64) ruby/2.4.3p205'
      }).
    to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'weather_api_stub.txt').read, headers: {})
  end
  
Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)
end