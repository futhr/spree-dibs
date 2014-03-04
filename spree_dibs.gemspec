lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_dibs/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_dibs'
  s.version     = SpreeDibs::VERSION
  s.summary     = 'Spree Payment Gateway for DIBS'
  s.description = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = ['FreeRunning Technologies', 'Tobias Bohwalli']
  s.email        = 'contact@freerunningtech.com'
  s.homepage     = 'http://freerunningtech.com'
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'spree_core', '~> 2.3.0.beta'

  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'rspec-rails',  '~> 2.14'
  s.add_development_dependency 'database_cleaner', '~> 1.2.0'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'sqlite3'
end
