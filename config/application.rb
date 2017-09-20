require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Circles
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |generator|
      generator.assets false
    end

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => "smtp.163.com",
        :port => 25,
        :domain => '163.com',
        :user_name => 'lhu_93@163.com',
        # 对于163邮箱，这里需要设置为163的授权码
        :password => 'hu518776',
        :authentication => :login
    }

    config.action_mailer.default_url_options = {host: 'http://192.168.18.128:3000/'}
  end
end
