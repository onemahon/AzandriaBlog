# http://vladigleba.com/blog/2014/08/12/provisioning-a-rails-server-using-chef-part-2-writing-the-recipes/

package "postgresql"
package "postgresql-contrib"

# change postgres password
execute "change postgres password" do
  user "postgres"
  command "psql -c \"alter user postgres with password '#{node['db']['root_password']}';\""
end

# create new postgres user
execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create user #{node['db']['user']['name']} with password '#{node['db']['user']['password']}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{node['db']['user']['name']}'\" | wc -l`.chomp == "1" }
end

# create new postgres database
execute "create new postgres database" do
  user "postgres"
  command "psql -c \"create database #{node['app']} owner #{node['db']['user']['name']};\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node['app']}'\" | wc -l`.chomp == "1" }
end

# TODO: VERY IMPORTANT: app will crash every few days unless otherwise dealt with
# Postgres logs need to be customized to allow log rotation regularly. That's
# done in /etc/postgresql/postgresql.conf, with the following properties set to:
#
# ```
# log_truncate_on_rotation = true
# log_rotation_age = 1d
# log_rotation_size = 100MB
# ```
#
# This setting should be done through chef somehow, but I'm not sure how to make
# that happen. Perhaps the same way the template files work? But, if not, I might
# need to learn a 3rd party recipe that works with postgresql setup.
