#!/usr/bin/env bash

echo "Installing youtube-dl ..."
  sudo apt-get -y install youtube-dl

echo "Installing VLC ..."
  sudo apt-get -y install vlc browser-plugin-vlc

echo "Installing Chromium ..."
  sudo apt-get -y install chromium-browser

echo "Installing Google Chrome ..."
  cd /tmp
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  cd

# Dropbox
  # https://linux.dropbox.com/packages/ubuntu/
