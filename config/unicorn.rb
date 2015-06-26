# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/blaugh"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/blaugh/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/blaugh/log/unicorn.log"
stdout_path "/var/www/blaugh/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.blaugh.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
