# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end

#
# # Set the current app's path for later reference. Rails.root isn't available at
# # this point, so we have to point up a directory.
# app_path = File.expand_path(File.dirname(__FILE__) + '/..')
#
# # The number of worker processes you have here should equal the number of CPU
# # cores your server has.
# worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)
#
# # You can listen on a port or a socket. Listening on a socket is good in a
# # production environment, but listening on a port can be useful for local
# # debugging purposes.
# listen app_path + '/tmp/unicorn.sock', backlog: 64
#
# # For development, you may want to listen on port 3000 so that you can make sure
# # your unicorn.rb file is soundly configured.
# listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'
#
# # After the timeout is exhausted, the unicorn worker will be killed and a new
# # one brought up in its place. Adjust this to your application's needs. The
# # default timeout is 60. Anything under 3 seconds won't work properly.
# timeout 60
#
# # Set the working directory of this unicorn instance.
# working_directory app_path
#
# # Set the location of the unicorn pid file. This should match what we put in the
# # unicorn init script later.
# pid app_path + '/tmp/unicorn.pid'
#
# # You should define your stderr and stdout here. If you don't, stderr defaults
# # to /dev/null and you'll lose any error logging when in daemon mode.
# stderr_path app_path + '/log/unicorn.log'
# stdout_path app_path + '/log/unicorn.log'
#
# # Load the app up before forking.
# preload_app true
#
# # Garbage collection settings.
# GC.respond_to?(:copy_on_write_friendly=) &&
#   GC.copy_on_write_friendly = true
#
# # If using ActiveRecord, disconnect (from the database) before forking.
# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) &&
#     ActiveRecord::Base.connection.disconnect!
# end
#
# # After forking, restore your ActiveRecord connection.
# after_fork do |server, worker|
#   defined?(ActiveRecord::Base) &&
#     ActiveRecord::Base.establish_connection
# end
#
#
#
#
#
#
#
# # worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
# # timeout 30
# # preload_app true
# #
# # before_fork do |server, worker|
# #   Signal.trap 'TERM' do
# #     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
# #     Process.kill 'QUIT', Process.pid
# #   end
# #
# #   defined?(ActiveRecord::Base) and
# #     ActiveRecord::Base.connection.disconnect!
# # end
# #
# # after_fork do |server, worker|
# #   Signal.trap 'TERM' do
# #     puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
# #   end
# #
# #   defined?(ActiveRecord::Base) and
# #     ActiveRecord::Base.establish_connection
# # end
#
#
# #
# # # Set the working application directory
# # # working_directory "/path/to/your/app"
# # working_directory "/var/www/blaugh"
# #
# # # Unicorn PID file location
# # # pid "/path/to/pids/unicorn.pid"
# # pid "/var/www/blaugh/current/tmp/pids/unicorn.pid"
# #
# # # Path to logs
# # # stderr_path "/path/to/log/unicorn.log"
# # # stdout_path "/path/to/log/unicorn.log"
# # stderr_path "/var/www/blaugh/log/unicorn.log"
# # stdout_path "/var/www/blaugh/log/unicorn.log"
# #
# # # Unicorn socket
# #
# # # Number of processes
# # # worker_processes 4
# # worker_processes 2
# #
# # # Time-out
# # timeout 30
