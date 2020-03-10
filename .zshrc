# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

alias ls='ls -GwF'
alias ll='ls -alh'
alias vi='nvim'
alias vim='nvim'

