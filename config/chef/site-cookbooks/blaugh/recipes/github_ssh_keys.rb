
chef_gem 'httparty' do
  compile_time false
end

# create their ssh key
execute 'generate ssh key for user' do
  user node['user']['name']
  creates "/home/#{node['user']['name']}/.ssh/id_rsa"
  command "ssh-keygen -t rsa -q -f /home/#{node['user']['name']}/.ssh/id_rsa -P ''"
  notifies :create, "ruby_block[add_ssh_key_to_github]"
  notifies :run, "execute[add_github_to_known_hosts]"
end

# add github.com to known hosts, so future deploys won't be interrupted
execute "add_github_to_known_hosts" do
  action :nothing # only run when ssh key is created
  user node['user']['name']
  command "ssh-keyscan -H github.com >> /home/#{node['user']['name']}/.ssh/known_hosts"
end

# send id_rsa.pub over to Github as a new deploy key
ruby_block "add_ssh_key_to_github" do
  action :nothing # only run when ssh key is created
  block do
    require 'httparty'
    response = HTTParty.post('https://api.github.com/user/keys', {
      basic_auth: {
        username: node['github_user'],
        password: node['github_pass']
      },
      body: {
        title: "#{node['user']['name']}@" + node['app'],
        key: File.read("/home/#{node['user']['name']}/.ssh/id_rsa.pub")
      }.to_json,
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'User-Agent' => 'Azandria'}
    })

    unless response.code == 200 or response.code == 201
      Chef::Log.warn("Could not add deploy key to Github, response: #{response.body}")
      Chef::Log.warn("Add the key manually:")
      Chef::Log.info(File.read("/home/#{node['user']['name']}/.ssh/id_rsa.pub"))
    end
  end
end
