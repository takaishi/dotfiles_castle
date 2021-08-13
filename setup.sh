#!/bin/bash
set -x

which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


ARRAY=(fish vim tmux fzf tig ghq tfenv tig stern jq gsed sshuttle gh rbenv ruby-install nodenv)
for item in ${ARRAY[@]}; do
  which $item > /dev/null|| brew install $item
done

which goenv > /dev/null || brew install --head goenv

