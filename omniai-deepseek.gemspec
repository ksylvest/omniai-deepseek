# frozen_string_literal: true

require_relative "lib/omniai/deepseek/version"

Gem::Specification.new do |spec|
  spec.name = "omniai-deepseek"
  spec.version = OmniAI::DeepSeek::VERSION
  spec.license = "MIT"
  spec.authors = ["Kevin Sylvestre"]
  spec.email = ["kevin@ksylvest.com"]

  spec.summary = "A generalized framework for interacting with DeepSeek"
  spec.description = "An implementation of OmniAI for DeepSeek"
  spec.homepage = "https://github.com/ksylvest/omniai-deepseek"

  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md Gemfile]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "event_stream_parser"
  spec.add_dependency "omniai", "~> 2.2"
  spec.add_dependency "zeitwerk"
end
