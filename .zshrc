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
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# path set
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/Celler/libxml2/2.9.1/lib:\$DYLD_LIBRARY_PATH
export GOROOT=/usr/local/bin/go

# phpenv
if [ -f ~/.phpenv/bin/phpenv ]; then
  export PATH=$HOME/.phpenv/bin:$PATH
  eval "$(phpenv init -)"
fi

# MacVim
case ${OSTYPE} in
 darwin*) # Mac OS X
 function macvim () {
   if [ -d /Applications/MacVim.app ]
   then
     [ ! -f $1 ] && touch $1
     open -a MacVim $1
   else
     vim $1
   fi
 }
#alias vim='macvim'
 ;;
esac

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
