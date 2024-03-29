# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include Devise::Test::IntegrationHelpers
  end

  module SignInHelper
    def sign_in_as(user)
      post sign_in_url(email: user.email, password: user.password)
    end
  end

  module ActionDispatch
    class IntegrationTest
      include SignInHelper
    end
  end
end
