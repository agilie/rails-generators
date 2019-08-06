module Skeleton
  class DevToolsGenerator < Rails::Generators::Base

    def install_all
      dot_env
      pretty_errors
      http_logs

      Bundler.with_clean_env do
        run 'bundle install'
      end
    end

    private

    def dot_env
      return unless yes?('Install dot-env gem for rails? (Y/n)')
      gem 'dotenv-rails', group: [:development, :test]
      create_file '.env'
    end

    def pretty_errors
      return unless yes?('Install `pretty errors` gem for rails? (Y/n)')
      gem_group :development do
        gem 'better_errors'
        gem 'binding_of_caller'
      end
    end

    def http_logs
      return unless yes?('Install HTTP logger for rails? (Y/n)')
      gem_group :development do
        gem 'httplog'
      end
    end

  end
end
