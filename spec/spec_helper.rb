# frozen_string_literal: true

require "pronto"
require "pronto/annotations_formatter"

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
