#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  dropbox
  google-chrome
  firefox
  iterm2
  atom
  vlc
  skype
  transmission
)

# fonts
fonts=(
  font-source-code-pro.rb
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew tap phinze/homebrew-cask
  brew install brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
