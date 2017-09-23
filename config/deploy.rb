# config valid only for current version of Capistrano
lock "3.9.1"

# 应用名称
set :application, "shopping"

# 默认值为git
# The Source Control Management used.
# 目前支持git,hg,svn
# set :scm, :git

# 设置资源的(git)地址
set :repo_url, "https://github.com/GLucien/learn_rails.git"

# 默认值为 "/var/www/#{fetch(:application)}"，fetch(:application)会获取配置的application值
# 可以设置成应用服务器的项目部署位置
# 目录需要是有效合法的
set :deploy_to, "/var/www/shopping"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

set :migration_role, :app

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  task :restart do
    invoke "deploy:unicorn_mine:reload"
  end
end

after 'deploy:publishing', 'deploy:restart'

