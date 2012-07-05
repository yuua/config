HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "C-p" history-beginning-search-bakcward-end
bindkey "C-n" history-beginning-search-forward-end

function history-all {history 1 }
[[ -s ~/.pythonbrew/etc/bashrc ]] && source ~/.pythonbrew/etc/bashrc

# cd set
setopt auto_cd
setopt auto_pushd

setopt correct

export PATH=$PATH:~/.rvm/scripts/'rvm'

if [ -f ~/.zsh/auto-fu.zsh.git/auto-fu.zsh ]; then
  source ~/.zsh/auto-fu.zsh.git/auto-fu.zsh
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi

autoload -U compinit
compinit 
