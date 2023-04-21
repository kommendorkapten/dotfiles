# Add homebrew stuff
eval "$(/opt/homebrew/bin/brew shellenv)"

PATH=${PATH}:"`go env GOPATH`/bin"
PATH=${PATH}:"${HOME}/opt/google-cloud-sdk/bin"
EDITOR=vi
SOFTHSM2_CONF=${HOME}/code/lsigstore/softhsm2.conf

PROMPT="%n@%m:%~ %# "
GPG_TTY=$(tty)

# Restore emacs key bindings. EDITOR=vi breaks this.
bindkey -e

alias ls='ls -F'
alias x509='openssl x509 -text -noout'

jcat() {
    cat $1 | jq
}

# Exports
export PROMPT
export EDITOR
export PATH
export GPG_TTY
export SOFTHSM2_CONF
