# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  include YouhaosudaApp

  # YouhaosudaApp::Config.initialize_connect!(
  #   {
  #     :app_key => '5c95892f62ce423a90726560f2de14f2', 
  #     :app_secret => '33e910c2dbcd4f44881ad1d2c53ec2f8', 
  #     :auth_url => 'http://apps.localtest.com/oauth2/token', 
  #     :api_host => "http://api.public.com/v1/"
  #   }
  # )
  YouhaosudaApp::Config.load("#{PADRINO_ROOT}/config/youhaosuda_app.yml")
  ACCESS_TOKEN  = YouhaosudaApp.generate_access_token unless defined?(ACCESS_TOKEN)

  API_HOST = YouhaosudaApp::Config.settings[:api_host] unless defined?(API_HOST)
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
