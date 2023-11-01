# frozen_string_literal: true

require_relative "lib/pronto/annotations_formatter/version"

Gem::Specification.new do |spec|
  spec.name          = "pronto-annotations_formatter"
  spec.version       = Pronto::AnnotationsFormatter::VERSION
  spec.summary       = "A gem to print out the warnings in a json format to be consumed by pronto-annotate-action."
  spec.description   = <<-DESCRIPTION
    This pronto formatter will print out the warnings in a json format to be consumed by
    https://github.com/emilio2hd/pronto-annotate-action.
  DESCRIPTION
  spec.homepage      = "https://github.com/emilio2hd/pronto-annotations_formatter"
  spec.license       = "MIT"

  spec.authors       = ["Emilio"]
  spec.email         = ["emilio2hd@gmail.com"]

  spec.metadata = {
    "changelog_uri" => "https://github.com/emilio2hd/pronto-annotations_formatter/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir.glob("lib/**/*.rb") + ["README.md", "CHANGELOG.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "pronto", ">= 0.11.2"

  spec.required_ruby_version = ">= 2.7"
end
