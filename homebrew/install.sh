#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
# Based on https://raw.githubusercontent.com/holman/dotfiles/6cb0f6c14522f2a7615042da0dcd68b4749ffa54/homebrew/install.sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

exit 0