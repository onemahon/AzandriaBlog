# http://vladigleba.com/blog/2014/08/12/provisioning-a-rails-server-using-chef-part-2-writing-the-recipes/

default['app']			= 'blaugh'

default['nodejs']['dir']	= '/usr/local'
default['nodejs']['version']	= '0.10.29'

default['ruby']['version']	= '2.1.3'
default['redis']['version']	= '2.8.13'
