module Skeleton
  class SwaggerGenerator < Rails::Generators::Base

    def add_gemfile
      gem 'rswag'

      Bundler.with_clean_env do
        run 'bundle install'
      end
    end

    def run_generators
      Bundler.with_clean_env do
        generate('rswag:install')
      end
    end

    def create_spec_folders
      create_file 'spec/requests/.keep'
      create_file 'spec/api/.keep'
      create_file 'spec/integration/.keep'
    end

  end
end
