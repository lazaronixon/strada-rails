# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "rails"
require "rails/test_help"
require_relative "../lib/strada-rails"

require "rails/test_unit/reporter"
Rails::TestUnitReporter.executable = "bin/test"

class ActiveSupport::TestCase
end
