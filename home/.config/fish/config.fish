set -x PATH $HOME/.rbenv/bin $PATH

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
set -U FZF_LEGACY_KEYBINDINGS 0

# fish-ghq
set -U GHQ_SELECTOR peco
