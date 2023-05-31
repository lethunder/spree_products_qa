# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_products_qa'
  s.version     = '0.0.1'
  s.summary     = 'Spree extension that adds Q&A support for products'
  s.description = 'Each product can have separate Q&A section. Registered users can ask a question, that admins answer.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Netguru'
  s.email     = 'hi@netguru.co'
  s.homepage  = 'http://netguru.co'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 2.3.0', '< 5.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_api', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'

  s.add_dependency 'good_job'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~>4.0.1'
  s.add_development_dependency 'sass-rails', '~> 6.0.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry'
end
