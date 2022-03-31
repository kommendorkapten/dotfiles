# Add homebrew stuff
eval "$(/opt/homebrew/bin/brew shellenv)"

PATH=${PATH}:"`go env GOPATH`/bin"
EDITOR=vi
# Restore emacs key bindings. EDITOR=vi breaks this.
bindkey -e
alias ls='ls -F'
PROMPT="%n@%m:%~ %# "
GPG_TTY=$(tty)

export PROMPT
export EDITOR
export PATH
export GPG_TTY
