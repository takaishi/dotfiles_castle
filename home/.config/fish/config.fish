set -U fish_user_paths ~/bin $fish_user_paths

if not test -e ~/.config/fish/functions/fisher.fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher z
  fisher omf/theme-clearance
  fisher omf/plugin-peco
  fisher yoshiori/fish-peco_select_ghq_repository
end

### Ruby (rbenv)
if test -e $HOME/.rbenv
  rbenv init - | source
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end


alias g='git'
alias gb='git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"'
#alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
#alias -g H='`curl -sL https://api.github.com/users/YOUR_USERNAME/repos | jq -r ".[].full_name" | peco --prompt "GITHUB REPOS>" | head -n 1`'
#alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/remotes\/[^\/]*\/\(\S*\)/\1 \0/"`'
#alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'
