#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end



if type -q direnv
  function __direnv_export_eval --on-variable PWD
    status --is-command-substitution; and return
    eval (direnv hook fish)
  end
else
  echo "Install direnv first! Check http://direnv.net" ^&1
end
