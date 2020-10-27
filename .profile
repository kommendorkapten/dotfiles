# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
PS1='${USER}@`hostname -s`:$(
    if [[ `id -un` == "root" ]]; then printf "%s" "${PWD}# "; else
    [[ ${PWD#$HOME} != $PWD ]] && printf "%s" "~${PWD#$HOME}\$ " ||
    printf "%s" "${PWD}\$ "; fi)'


export PATH HOME TERM PS1


