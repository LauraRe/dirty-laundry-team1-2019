OpenWeatherAPI.configure do |config|
    # API key
    config.api_key = '9f17e0746e709d22e5f04a5160c8abc2'
  
    # Optionals
    config.default_language = 'en'     # 'en' by default
    config.default_country_code = 'en' # nil by default (ISO 3166-1 alfa2)
    config.default_units = 'metric'    # 'metric' by default
end