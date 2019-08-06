module Skeleton
  class DeviseTokenAuthGenerator < Rails::Generators::Base

    # def add_gemfile
    #   gem 'devise'
    #   gem 'devise_token_auth'
    #   gem 'rack-cors', :require => 'rack/cors'
    #
    #   Bundler.with_clean_env do
    #     run 'bundle install'
    #   end
    # end
    #
    # def run_generators
    #   model_name = ask('What would you like the user model to be called [User by default]?')
    #   mount_path = ask('What would you like the mount path to be called [auth by default]?')
    #
    #   model_name = 'User' if model_name.blank?
    #   mount_path = 'auth' if mount_path.blank?
    #
    #   Bundler.with_clean_env do
    #     generate 'devise_token_auth:install', model_name, mount_path
    #   end
    # end
    #
    # def run_migrations
    #   if yes?('Would you like to run the migrations now? (Y/n)')
    #     rake 'db:migrate'
    #   end
    # end

    def update_cors
      inject_into_file 'config/application.rb', after: 'class Application < Rails::Application' do
        <<-RUBY
        

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: [:get, :post, :options, :delete, :put]
      end
    end

        RUBY
      end
    end

  end
end
