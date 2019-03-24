set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/bin $PATH
set -x GOPATH $HOME
set -x GO111MODULE on

# alias
alias git hub
alias g git
alias gd "git diff --color -w"
alias j "z"
alias l "exa -l"

if test (which colordiff)
  alias diff "colordiff -u"
else
  alias diff "diff -u"
end

if type -q direnv
  function __direnv_export_eval --on-variable PWD
    status --is-command-substitution; and return
    eval (direnv hook fish)
  end
else
  echo "Install direnv first! Check http://direnv.net" ^&1
end

function history-merge --on-event fish_preexec
  history --save
  history --merge
end

function peco_sync_select_history
  history-merge
  peco_select_history $argv
end

function refresh-tmux --on-event fish_preexec
  if test -n $TMUX
    tmux refresh-client -S
  end
end

# fzf
set -U FZF_LEGACY_KEYBINDINGS 1

# fish-ghq
set -U GHQ_SELECTOR peco

if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '$HOME/google-cloud-sdk/path.fish.inc'; else; . '$HOME/google-cloud-sdk/path.fish.inc'; end; end

bass source ~/.google-cloud-sdk/path.bash.inc
bass source ~/.google-cloud-sdk/completion.bash.inc

