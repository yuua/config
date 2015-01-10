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
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# cd set
setopt auto_cd
setopt auto_pushd

setopt correct

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# path set
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export GOROOT=/usr/local/bin/go
export GOPATH=$HOME/go
export PATH=$HOME/.rbenv/bin:$PATH

# phpenv
if [ -f ~/.phpenv/bin/phpenv ]; then
  export PATH=$HOME/.phpenv/bin:$PATH
  eval "$(phpenv init -)"
fi

export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

# alias
alias ll="ls -lac"
alias history="history-all"
alias be="bundle exec"
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias vim="reattach-to-user-namespace vim"

if [ -f ~/.zsh/zshfiles/auto-fu.zsh.git/auto-fu.zsh ]; then
  source ~/.zsh/zshfiles/auto-fu.zsh.git/auto-fu.zsh
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi

if [ -z "$TMUX" -a -z "$STY" ]; then
  if type tmuxx >/dev/null 2>&1; then
    tmuxx
  elif type tmux >/dev/null 2>&1; then
    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
      tmux attach && echo "tmux attached session "
    else
      tmux new-session && echo "tmux created new session"
    fi
  elif type screen > /dev/null 2>&1; then
    screen -rx || screen -D -RR
  fi
fi

case "$TERM" in
  xterm*|kterm*|rxvt*)
  PROMPT=$(print "%B%{\e[34m%]}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%]}%# %b")
  PROMPT=$(print "%{\e}")2;%n@%m: %~\7%}$PROMPT"" # title bar
  ;;
  *)
  PROMPT='%m:%c%# '
  ;;
esac

nprom () {
    setopt prompt_subst
    local rbase=$'%{\e[33m%}[%%{\e[m%}' lf=$'\n'
    local pct=$'%0(?||%18(?||%{\e[31m%}))%#%{\e[m%}'
    RPROMPT="%9(~||$rbase)"
    case "$USER" in
      yatex)	PROMPT=$'%{\e[33m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      java)	PROMPT=$'%{\e[36m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      *)
    local pbase=$'%{\e[$[32+RANDOM%5]m%}%U%B%m{%n}%b'"$pct%u "
    PROMPT="%9(~|$rbase$lf|)$pbase"
    ;;
    esac
    [[ "$TERM" = "screen" ]] && RPROMPT="[%U%~%u]"
}
nprom

autoload -U compinit
compinit 
