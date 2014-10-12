#!/usr/bin/env bash

echo "Installing Git ..."
  sudo apt-get -y install git

echo "Installing base ruby build dependencies ..."
  sudo apt-get -y build-dep ruby1.9.3

echo "Installing libraries for common gem dependencies ..."
  sudo apt-get -y install libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libqtwebkit-dev libreadline-dev

echo "Installing vim ..."
  sudo apt-get -y install vim-gtk

echo "Installing sqlite3 ..."
 sudo apt-get -y install libsqlite3-dev sqlite3

echo "Installing Postgres ..."
  sudo apt-get -y install postgresql postgresql-server-dev-all postgresql-contrib

echo "Installing Redis ..."
  sudo apt-get -y install redis-server

echo "Installing curl ..."
  sudo apt-get -y install curl

echo "Installing rbenv ..."
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

echo "Installing rbenv-gem-rehash so the shell automatically picks up binaries after installing gems with binaries..."
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

echo "Installing ruby-build, to install Rubies ..."
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

echo "Installing Ruby $ruby_version ..."
  if [ "$ruby_version" = "2.1.1" ]; then
    curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.1
  else
    rbenv install "$ruby_version"
  fi

echo "Setting $ruby_version as global default Ruby ..."
  rbenv global $ruby_version
  rbenv rehash

echo "Updating to latest Rubygems version ..."
  gem update --system

echo "Installing Rails ..."
  gem install rails -V

echo "Installing Bundler ..."
  gem install bundler --no-document --pre

echo "Configuring Bundler for faster, parallel gem installation ..."
  number_of_cores=$(nproc)
  bundle config --global jobs $((number_of_cores - 1))

echo "Installing ImageMagick ..."
  sudo apt-get -y install imagemagick

echo "Installing watch, to execute a program periodically and show the output ..."
  sudo apt-get -y install watch

echo "Installing rake ..."
  sudo apt-get -y install rake

echo "Installing ubuntu-restricted-extras ..."
  sudo apt-get -y install ubuntu-restricted-extras

echo "Installing Node.js ..."
  sudo apt-get -y install python-software-properties python g++ make
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get -y install nodejs
  
  echo "Installing golang"
  sudo add-apt-repository ppa:duh/golang
  sudo apt-get update
  sudo apt-get install golang

# Install Phantomjs
  # cd /usr/local/share
  # sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
  # sudo tar xvf phantomjs-1.9.2-linux-x86_64.tar.bz2
  # sudo rm phantomjs-1.9.2-linux-x86_64.tar.bz2
  # sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
  # cd
