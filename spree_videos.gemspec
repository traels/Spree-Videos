Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_videos'
  s.version     = '1.3.2'
  s.summary     = 'Adds youtube videos to Spree commerce products'
  s.description = 'Add multiuple youtube videos, and a thumbnail selector' + 
                  'for those products to a Spree commerce product'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Michael Bianco'
  s.email             = 'info@cliffsidedev.com'
  s.homepage          = 'http://mabblog.com/'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'
#  s.add_dependency 'youtube_it', '~> 2.3.2'

  # test suite
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
end
