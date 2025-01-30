# frozen_string_literal: true

require "simplecov"
require "webmock/rspec"

SimpleCov.start do
  enable_coverage :branch
end

require "omniai/deepseek"

OmniAI::DeepSeek.configure do |config|
  config.api_key = "..."
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
