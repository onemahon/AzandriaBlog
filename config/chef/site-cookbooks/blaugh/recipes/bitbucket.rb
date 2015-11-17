
chef_gem 'httparty' do
  compile_time false
end

# create their ssh key
execute 'generate ssh key for user' do
  user node['user']['name']
  creates "/home/#{node['user']['name']}/.ssh/id_rsa"
  command "ssh-keygen -t rsa -q -f /home/#{node['user']['name']}/.ssh/id_rsa -P ''"
  notifies :create, "ruby_block[add_ssh_key_to_bitbucket]"
  notifies :run, "execute[add_bitbucket_to_known_hosts]"
end

# add bitbucket.org to known hosts, so future deploys won't be interrupted
execute "add_bitbucket_to_known_hosts" do
  action :nothing # only run when ssh key is created
  user node['user']['name']
  command "ssh-keyscan -H bitbucket.org >> /home/#{node['user']['name']}/.ssh/known_hosts"
end

# send id_rsa.pub over to Bitbucket as a new deploy key
ruby_block "add_ssh_key_to_bitbucket" do
  action :nothing # only run when ssh key is created
  block do
    require 'httparty'
    url = "https://api.bitbucket.org/1.0/repositories/#{node['bitbucket_user']}/#{node['bitbucket_repo']}/deploy-keys"
    response = HTTParty.post(url, {
      :basic_auth => {
        :username => node['bitbucket_user'],
        :password => node['bitbucket_pass']
      },
      :body => {
        :label => "#{node['user']['name']}@" + node['app'],
        :key => File.read("/home/#{node['user']['name']}/.ssh/id_rsa.pub")
      }
    })

    unless response.code == 200 or response.code == 201
      Chef::Log.warn("Could not add deploy key to Bitbucket, response: #{response.body}")
      Chef::Log.warn("Add the key manually:")
      Chef::Log.info(File.read("/home/#{node['user']['name']}/.ssh/id_rsa.pub"))
    end
  end
end
