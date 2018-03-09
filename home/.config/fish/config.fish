#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

# alias
alias gl "cd (ghq root)/(ghq list | peco)"
alias gd "git diff --color -w"

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


function peco_sync_select_history
  history-merge
  peco_select_history $argv
end

function fish_user_key_bindings
  bind \cr 'peco_sync_select_history (commandline -b)'
end
