



## Homebrew

```
$ brew update; and brew upgrade; and brew cleanup
```

### Formulae

```
% echo $(cat ~/.homesick/repos/dotfiles_castle/brew_formulae_list) $(brew list --formulae --full-name -1) | sed 's/ /\n/g' | sort -u > ~/.homesick/repos/dotfiles_castle/brew_formulae_list
```

```
$ brew install $(cat ~/.homesick/repos/dotfiles_castle/brew_formulae_list)
```

### Casks

```
$ echo $(cat ~/.homesick/repos/dotfiles_castle/brew_cask_list) $(brew list --casks --full-name -1) | sed 's/ /\n/g' | sort -u > ~/.homesick/repos/dotfiles_castle/brew_cask_list
```

```
$ brew install $(cat ~/.homesick/repos/dotfiles_castle/brew_formulae_list)
```

