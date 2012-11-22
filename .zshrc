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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# path set
export PATH=/usr/local/bin:$PATH

# alias
alias ll="ls -lac"
alias history="history-all"
alias be="bundle exec"
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

if [ -f ~/.zsh/zshfiles/auto-fu.zsh.git/auto-fu.zsh ]; then
  source ~/.zsh/zshfiles/auto-fu.zsh.git/auto-fu.zsh
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi

autoload -U compinit
compinit 
