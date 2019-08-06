module Skeleton
  class TestsGenerator < Rails::Generators::Base

    source_root __dir__

    def add_gemfiles
      gem_group :development, :test do
        gem 'rspec-rails', '~> 3.7'
        gem 'factory_bot_rails', '~> 4.0'
        gem 'simplecov', require: false, group: :test
      end
    end

    def configure_rspec
      Bundler.with_clean_env do
        run 'bundle install'
        generate 'rspec:install'
      end
    end

    def configure_factory_bot
      template 'factory_bot.tt', 'spec/support/factory_bot.rb'
      inject_into_file 'spec/rails_helper.rb', :after => 'require \'rspec/rails\'' do
        <<-RUBY

require 'support/factory_bot'

        RUBY
      end
    end

    def configure_coverage
      inject_into_file 'spec/spec_helper.rb', before: 'RSpec.configure' do
        <<-RUBY

require 'simplecov'
SimpleCov.start

        RUBY
      end
    end

  end
end
