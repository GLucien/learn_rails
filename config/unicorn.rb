rails_root = File.expand_path("")
puts rails_root

worker_processes 4
working_directory rails_root #自己项目的根目录

listen 3000, :tcp_nopush => false
listen "/var/tmp/.unicorn.sock"

timeout 180

pid "/var/tmp/unicorn.pid"

stderr_path "#{rails_root}/log/unicorn.log"
stdout_path "#{rails_root}/log/unicorn.log"

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end
