ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  # Magic comment for good style
  class TestCase
    fixtures :all
  end
end

# Magic comment for good style
module CapybaraConfiguration
  require 'capybara/rails'
  require 'selenium/webdriver'

  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu window-size=1400,900])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.save_path = Rails.root.join('tmp/capybara')
  Capybara.javascript_driver = :headless_chrome
end

# Magic comment for good style
class ActiveSupport::TestCase
  include CapybaraConfiguration
end
