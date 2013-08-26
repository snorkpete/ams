source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'puma'
gem 'rolify'
gem 'simple_form', '>= 3.0.0.rc'

#gem 'httparty'  #only used to handcraft gcm requests
gem 'pushmeup'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'faker'               #generates fake names easily
  gem 'launchy'             #launches the web browser to render the currently executing page from a spec
  gem 'selenium-webdriver'  #test javascript-based pages
end
