#
# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
#

typeset +x PS1="\u@\h:\w\\$ "
alias ls='ls -F --color'
GPG_TTY=$(tty)
EDITOR=vi
export EDITOR
export GPG_TTY
