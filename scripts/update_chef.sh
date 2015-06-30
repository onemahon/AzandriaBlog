#!/bin/sh

# check for correct number of arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <user> <ip> <port>"
  exit 1
fi

# set variables
USER=$1
IP=$2
PORT=$3

# install chef
cd ../config/chef && knife solo prepare -p $PORT $USER@$IP

# execute the run list
knife solo cook -p $PORT $USER@$IP

# upload key for user
ssh-copy-id -i ~/.ssh/id_rsa.pub -p $PORT $USER@$IP

# upload app
cd ../..
bundle exec cap production setup # secrets stuff
bundle exec cap production setup:all # the rest of the deploy

# restart nginx
ssh -p $PORT -t $USER@$IP 'sudo service nginx restart'
