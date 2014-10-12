#
# Binary installer
#

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Update homebrew"
  brew update && brew upgrade brew-cask

echo "Installing GNU core utilities (those that come with OS X are outdated)"
  brew install coreutils

echo "Installing GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed"
  brew install findutils

echo "Installing Bash 4"
  brew install bash

echo "Install Git"
  brew install git

echo "Installing GitHub CLI client ..."
  brew_install 'gh'

echo "Installing Postgres, a good open source relational database ..."
  brew install postgres --no-python

echo "Installing Redis, a good key-value database ..."
  brew install redis

echo "Installing The Silver Searcher (better than ack or grep) to search the contents of files ..."
  brew install the_silver_searcher

echo "Installing vim from Homebrew to get the latest version ..."
  brew install vim

echo "Installing ctags, to index files for vim tab completion of methods, classes, variables ..."
  brew install ctags

echo "Installing tmux, to save project state and switch between projects ..."
  brew install tmux

echo "Installing reattach-to-user-namespace, for copy-paste and RubyMotion compatibility with tmux ..."
  brew install reattach-to-user-namespace

echo "Installing ImageMagick, to crop and resize images ..."
  brew install imagemagick

echo "Installing QT, used by Capybara Webkit for headless Javascript integration testing ..."
  brew install qt

echo "Installing watch, to execute a program periodically and show the output ..."
  brew install watch

echo "Starting Postgres ..."
  brew services start postgres

echo "Installing rbenv, to change Ruby versions ..."
  brew install rbenv

echo "Enable shims and autocompletion ..."
  eval "$(rbenv init -)"

echo "Installing rbenv-gem-rehash so the shell automatically picks up binaries after installing gems with binaries..."
  brew install rbenv-gem-rehash

echo "Installing ruby-build, to install Rubies ..."
  brew install ruby-build

echo "Upgrading and linking OpenSSL ..."
  brew install openssl
  brew link openssl --force

ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

echo "Installing Ruby $ruby_version ..."
  rbenv install "$ruby_version"

echo "Setting $ruby_version as global default Ruby ..."
  rbenv global "$ruby_version"
  rbenv rehash

echo "Updating to latest Rubygems version ..."
  gem update --system

echo "Installing Bundler to install project-specific Ruby gems ..."
  gem install bundler --no-document --pre

echo "Configuring Bundler for faster, parallel gem installation ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))

echo "Installing Rails ..."
  gem install rails -V

echo "Installing GitHub CLI client ..."
  brew install hub

echo "Installing Phantom.js ..."
  brew install phantomjs

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Remove outdated versions from the cellar
brew cleanup

exit 0
