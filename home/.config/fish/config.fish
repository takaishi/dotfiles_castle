
if not test -e ~/.config/fish/functions/fisher.fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher z
  fisher omf/theme-clearance
  fisher omf/plugin-peco
  fisher yoshiori/fish-peco_select_ghq_repository
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end
