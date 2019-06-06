$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "biovision/testimonials/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "biovision-testimonials"
  spec.version     = Biovision::Testimonials::VERSION
  spec.authors     = ["Maxim Khan-Magomedov"]
  spec.email       = ["maxim.km@gmail.com"]
  spec.homepage    = "https://github.com/Biovision/biovision-testimonials"
  spec.summary     = "Testimonials component for biovision-based applications"
  spec.description = "Testimonials component for biovision-based applications"
  spec.license     = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency 'rails-i18n', '~> 5.0'

  spec.add_dependency 'biovision-base'

  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency "pg"
  spec.add_development_dependency 'rspec-rails'
end
