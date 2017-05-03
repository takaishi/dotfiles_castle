
fisher z
fisher omf/theme-clearance
fisher omf/plugin-peco
fisher yoshiori/fish-peco_select_ghq_repository

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end
