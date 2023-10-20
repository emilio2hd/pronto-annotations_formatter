# frozen_string_literal: true

require_relative "lib/pronto/annotations_formatter/version"

Gem::Specification.new do |spec|
  spec.name          = 'pronto-annotations_formatter'
  spec.version       = Pronto::AnnotationsFormatter::VERSION
  spec.authors       = ["Emilio"]
  spec.email         = ["emilio2hd@gmail.com"]

  spec.summary       = "Pronto gem to print the warnings in json formmated to be consumed by pronto-annotate-action."
  spec.description   = "Pronto gem to print the warnings in json formmated to be consumed by pronto-annotate-action."
  spec.homepage      = "https://github.com/emilio2hd/pronto-annotations_formatter"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/emilio2hd/pronto-annotations_formatter"
  spec.metadata["changelog_uri"] = "https://github.com/emilio2hd/pronto-annotations_formatter"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pronto", ">= 0.5.0"
end
