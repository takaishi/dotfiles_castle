#!/bin/bash
set -x

which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


ARRAY=(fish vim tmux fzf tig ghq tfenv tig stern jq gsed sshuttle gh)
for item in ${ARRAY[@]}; do
  which $item > /dev/null|| brew install $item
done


export SHELL=/bin/bash
which anyenv > /dev/null || (brew install anyenv && eval "$(anyenv init -)" && anyenv install --init && \
  mkdir -p $(anyenv root)/plugins && git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update) 

ARRAY=(rbenv phpenv goenv pyenv nodenv)
for item in ${ARRAY[@]}; do
  test -e ~/.anyenv/envs/$item || (anyenv install $item)
done

