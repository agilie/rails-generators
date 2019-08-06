module Skeleton
  class ActiveAdminGenerator < Rails::Generators::Base

    def add_gemfile
      gem 'devise'
      gem 'activeadmin'

      Bundler.with_clean_env do
        run 'bundle install'
      end
    end

    # TODO: Sometimes fails on active_admin:assets and should rerun
    def run_generators
      Bundler.with_clean_env do
        generate('active_admin:install')
      end
    end

    def run_migrations
      if yes?('Run active admin migrations? (Y/n)')
        rake 'db:migrate'
      end
    end

    def run_seeds
      if yes?('Add seed to the database? (Y/n)')
        rake 'db:seed'
      end
    end

  end

end
