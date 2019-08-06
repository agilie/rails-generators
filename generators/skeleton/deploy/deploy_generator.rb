module Skeleton
  class DeployGenerator < Rails::Generators::Base

    source_root __dir__

#     def add_gemfile
#       gem_group :development do
#         gem 'capistrano', '~> 3.6'
#         gem 'capistrano-rails'
#         gem 'capistrano-bundler'
#         gem 'capistrano-rvm'
#       end
#       Bundler.with_clean_env do
#         run 'bundle install'
#       end
#     end
#
#     def run_generators
#       Bundler.with_clean_env do
#         run 'bundle exec cap install'
#       end
#     end
#
    def capify_this_shit
      inject_into_file 'Capfile', after: '# Include tasks from other gems included in your Gemfile' do
        <<-RUBY

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

        RUBY
      end
    end

    def configure_deploy_file
      append_to_file 'config/deploy.rb', after: '# set :ssh_options, verify_host_key: :secure' do
        File.read("#{__dir__}/remote_rake_task.tt")
      end
    end

  end
end
