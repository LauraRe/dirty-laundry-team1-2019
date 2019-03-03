require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module DirtyLaundryTeam12019
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.system_tests false
    end

    config.stripe.secret_key = 'sk_test_SfGc4FrtyPJXeMQP58EJRmxM'
    config.stripe.publishable_key = 'pk_test_uC6X9Rshj8WCjuGBfN9o9HvT'
  end
end
