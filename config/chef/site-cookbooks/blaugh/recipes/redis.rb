# http://vladigleba.com/blog/2014/08/12/provisioning-a-rails-server-using-chef-part-2-writing-the-recipes/

package "tcl8.5"

# download redis
remote_file "/home/#{node['user']['name']}/redis-#{node['redis']['version']}.tar.gz" do
  source "http://download.redis.io/releases/redis-#{node['redis']['version']}.tar.gz"
  mode 0644
  action :create_if_missing
end

# install redis
bash 'install redis' do
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    tar xzf redis-#{node['redis']['version']}.tar.gz
    cd redis-#{node['redis']['version']}
    make && make install
  EOH
  not_if { File.exists?("/usr/local/bin/redis-server") &&
           `redis-server --version`.chomp.split[2] == "v=#{node['redis']['version']}" }
end

# install redis server
execute "curl -L https://gist.githubusercontent.com/onemahon/eb93b39b9575b1d66b02/raw | sh" do
  cwd "/home/#{node['user']['name']}/redis-#{node['redis']['version']}/utils"
  not_if "ls /etc/init.d | grep redis"
end
