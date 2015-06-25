#
# Cookbook Name:: blaugh
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# http://vladigleba.com/blog/2014/08/12/provisioning-a-rails-server-using-chef-part-2-writing-the-recipes/

# update package database
execute "apt-get update"

# Install packages
package "telnet"
package "postfix"
package "curl"
package "git-core"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
package "libpq-dev"
package "build-essential"
package "tree"

# Set timezone
bash "set timezone" do
  code <<-EOH
    echo 'US/Eastern' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'EDT\|EST'"
end
