#!/usr/local/bin/fish
#

set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH /usr/local/kubebuilder/bin/ $PATH
set -x PATH /usr/local/opt/python/libexec/bin $PATH
set -x PATH $HOME/Library/Python/3.7/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH /usr/local/opt/gnu-time/libexec/gnubin $PATH
set -x PATH $HOME/.krew/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/flutter/bin $PATH
set -x PATH /usr/local/bin $PATH



set -x GOPATH $HOME
set -x GO111MODULE on
set -x PATH /usr/local/opt/libxml2/bin $PATH
set -x LANG en_US.UTF-8
set -x PATH /usr/local/opt/avr-gcc@8/bin $PATH
set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -x DYLD_LIBRARY_PATH /usr/local/Cellar/openssl/1.0.2s/lib

set -x QMK_HOME $HOME/src/github.com/takaishi/qmk_firmware


set -x LDFLAGS -L/usr/local/opt/libxml2/lib
set -x CPPFLAGS -I/usr/local/opt/libxml2/include

# You can get openssl-dir to exec 'brew --prefix openssl@1.1'
set -x RUBY_CONFIGURE_OPTS --with-openssl-dir=/usr/local/opt/openssl@1.1

# alias
alias git hub
alias g git
alias gd "git diff --color -w"
alias j "z"
alias l "exa -l"

alias k kubectl
alias kssh "kelm --namespace default --kind nodes --action ssh"
alias kstern "kelm --kind deployments --action stern"

if test (which colordiff)
  alias diff "colordiff -u"
else
  alias diff "diff -u"
end

function export
    set -l s (string split -m1 = $argv)
    set -xg $s
end

# fzf
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -U FZF_LEGACY_KEYBINDINGS 1

# fish-ghq
set -U GHQ_SELECTOR fzf

if test -e $HOME/google-cloud-sdk
  bass source ~/google-cloud-sdk/path.bash.inc
  bass source ~/google-cloud-sdk/completion.bash.inc
  set -x PATH $HOME/google-cloud-sdk/bin $PATH
end

source ~/.config/fish/fubectl.fish

if not test -e $HOME/.krew/bin/kubectl-krew
  begin
    set -x; set temp_dir (mktemp -d); cd "$temp_dir" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
    tar zxvf krew.tar.gz &&
    set KREWNAME krew-(uname | tr '[:upper:]' '[:lower:]')_(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/') &&
    ./$KREWNAME install krew &&
    set -e KREWNAME; set -e temp_dir
    kubectl krew install ctx
    kubectl krew install ns
    cd $HOME
  end
end

bind \cx 'kubectl ctx'
bind \cn 'kubectl ns'



# port from https://ten-snapon.com/archives/2622
function __fzf_git_branch -d ''
  # commiterdate:relativeを commiterdate:localに変更すると普通の時刻表示
  set -l selected_line (git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
        | column -t -s '|' \
        | grep -v 'origin' \
        | fzf \
        | head -n 1 \
        | awk '{print $1}')
  if [ -n "$selected_line" ]
    git checkout {$selected_line}
  end
end

bind \cb '__fzf_git_branch'
