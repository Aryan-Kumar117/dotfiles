
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/aryan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep notify
# End of lines configured by zsh-newuser-install
eval "$(starship init zsh)"
alias rm='rm -i'
alias config='/usr/bin/git --git-dir=/home/aryan/.cfg/ --work-tree=/home/aryan'
PROMPT_EOL_MARK=''
export PATH="$HOME/.local/bin:$PATH"

alias vim='nvim'
