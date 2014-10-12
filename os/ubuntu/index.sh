#!/usr/bin/env bash

set -e

# Load modules
source "$lib/user/index.sh"
source "$lib/is-ubuntu/index.sh"

# Only run if we're running Ubuntu
if [ 0 -eq `ubuntu` ]; then
  exit 0
fi

# Update ubuntu
sudo aptitude    update
sudo aptitude -y upgrade

# Create a user
while true; do
  read -p "Create a new username (username, no)? " user
  case $user in
    "" | "y" | "yes" )
      echo "please enter a new username"
      ;;
    "n" | "no" )
      echo "no username created"
      user="root"
      home="/root"
      break
      ;;
    * )
      user add $user
      home="/home/$user"
      break
      ;;
  esac
done

# TODO, reorganize

# Install git and curl
apt-get install -y git curl

# Add public ssh key
mkdir -p $home/.ssh
curl -L "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/85a63f31925ac6e0a6c13826573f3a005c765f10/id_rsa.pub" >> $home/.ssh/authorized_keys
chown -R $user:$user $home/.ssh
chmod 700 $home/.ssh
chmod 600 $home/.ssh/authorized_keys

# Switch to user
cd $home
su $user
