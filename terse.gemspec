# frozen_string_literal: true

require_relative "lib/terse/version"

Gem::Specification.new do |spec|
  spec.name = "terse"
  spec.version = Terse::VERSION
  spec.authors = ["Zachery Hostens"]
  spec.email = ["zacheryph@gmail.com"]

  spec.summary = "Terse, Clear, Concise, Simple Constructs for Cleaner Code"
  spec.description = "Terse (simple) patterns that have well defined purpose for existing."
  spec.homepage = "https://github.com/zacheryph/terse"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  # Runtime Dependencies
  # spec.add_dependency "example-gem", "~> 1.0"

  # Development Dependencies
  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("rspec", "~> 3.0")
  spec.add_development_dependency("standard", "~> 1.44")
end
