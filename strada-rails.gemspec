# frozen_string_literal: true

require_relative "lib/strada/rails/version"

Gem::Specification.new do |spec|
  spec.name = "strada-rails"
  spec.version = Strada::Rails::VERSION
  spec.authors = ["Nixon"]
  spec.email = ["lazaronixon@hotmail.com"]

  spec.summary = "Create fully native controls, driven by your web app."
  spec.homepage = "https://strada.hotwired.dev"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lazaronixon/strada-rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
end
