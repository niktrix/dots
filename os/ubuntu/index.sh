#!/usr/bin/env bash

set -e

# Load modules
source "$lib/symlink/index.sh"
source "$lib/is-ubuntu/index.sh"
source "$lib/user/index.sh"

# Only run if we're running Ubuntu
if [ 0 -eq `ubuntu` ]; then
  exit 0
fi

# exit 1
# paths
ubuntu="$os/ubuntu"

# Update ubuntu
sudo apt-get update
sudo apt-get -y upgrade

# Run each program
sh "$ubuntu/binaries.sh"
sh "$ubuntu/apps.sh"

# Symlink the profile
if [[ ! -e "$home/.bash_profile" ]]; then
  echo "symlinking: $ubuntu/profile.sh => $home/.bash_profile"
  symlink "$ubuntu/profile.sh" "$home/.bash_profile"
  source $home/.bash_profile
else
  echo "$home/.bash_profile already exists. remove and run again."
fi

# # Add public ssh key
# mkdir -p $home/.ssh
# curl -L "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/85a63f31925ac6e0a6c13826573f3a005c765f10/id_rsa.pub" >> $home/.ssh/authorized_keys
# chown -R $user:$user $home/.ssh
# chmod 700 $home/.ssh
# chmod 600 $home/.ssh/authorized_keys
#
# # Switch to user
# cd $home
# su $user
