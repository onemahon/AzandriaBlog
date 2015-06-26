#!/bin/sh

# check for correct number of arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 <ip> (ONLY RUN ON FIRST SETUP OF NEW MACHINE)"
  exit 1
fi

# set variables
IP=$1

# upload key for root
ssh-copy-id -i ~/.ssh/id_rsa.pub root@$IP

# install chef
cd ../config/chef && knife solo prepare root@$IP

# execute the run list
knife solo cook root@$IP
