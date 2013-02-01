source 'http://rubygems.org'

gem 'rails', '~> 3.0.20'
gem 'i18n', "~> 0.5.0"

gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'compass', "~> 0.10.6"
gem 'haml-rails'
gem 'interpret', :git => "git://github.com/rogercampos/interpret.git"

gem 'simple_form'
gem 'heroku'

gem 'carrierwave'
gem 'mini_magick'

gem 'jammit'

gem 'hominid'
gem 'armot', :git => "git://github.com/rogercampos/armot.git"

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
  gem 'ruby-debug19'
end

group :production, :staging do
  gem 'mysql2'
end

group :production do
  gem "exception_notification", :git => "http://github.com/rails/exception_notification.git", :require => 'exception_notifier'
end
