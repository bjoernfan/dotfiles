trap clear 0

alias ls="ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first"
alias l="ls"
alias ll="l -l"
alias la="l -a"
alias lt="l -t"
alias lsl="ls -alh --color=always|less"

alias lz="l *(.L0)"
alias lx="l *(.x)"

alias -g L="|less"

alias less="less -r"
alias mv="mv -v"
alias diff="diff -u"
alias rm="rm -iv"
alias asdf="setxkbmap se -variant svorak && xset r rate 185 50 && if [ -f ~/bin/swap_escape_capslock.sh ]; then ~/bin/swap_escape_capslock.sh; fi"
alias aoeu="setxkbmap se"
alias spelain="arecord -f cd -t raw -D hw:1 | oggenc - -r -o out.ogg "
alias nethack="nethack -u bjorn-wiz-hum-neu-mal"
alias grep="grep --color"
alias mv2lc="for i in *; do mv -nv $i $(echo $i | tr '[A-Z]' '[a-z]'); done"
alias lsof="lsof -N"
alias week="date +%V"

alias beep='echo -e \\a'

alias ga='git-annex'

export DEBEMAIL="bjorn@hygiena.org"
export DEBFULLNAME="Björn Pettersson"
export TERM="xterm-256color"

export XDG_DATA_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.config
export OOO_FORCE_DESKTOP="gnome"
export PS1="$(print '
%{\e[1;38m%}%m:%n%{\e[0m%}%{\e[0;37m%}%{\e[0m%}%{\e[1;32m%}%~%{\e[0m%}%{\e[0;37m%}
%{\e[0m%}%{\e[1;32m%}%?%{\e[0m%}%{\e[0m%}')> "
#export RPS1="[%~]"
export EDITOR=/usr/bin/vim
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.mkv=01;35:*.ogm=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export PATH="$HOME/bin:/bin:/usr/bin:/usr/local/bin:/usr/bin/X11:/usr/games:/sbin:/usr/sbin:/usr/local/sbin:/home/bjoernfan/bin:/opt/java/bin:/opt/java/jre/bin/java:/usr/bin/perlbin/core/:$HOME/src/mailicious/script:/usr/share/fslint/fslint/"

export MANPATH="$MANPATH:/usr/local/share/man"

export HISTSIZE=1000

setopt listpacked \
       AUTO_CD    \
       LIST_TYPES \
       MARK_DIRS

set -o vi

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

autoload -U compinit
compinit -u

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo match:%b %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s/:/)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:kill*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill*:*' menu yes select

# Auto rehashing
function compctl_rehash {
	rehash
	reply=()
}

compctl -C -c + -K compctl_rehash + -c

# Hash table

hash -d music=/data/music
hash -d torrents=/data/downloads/torrents
hash -d tmp=/data/tmp

[ -f /tmp/updates_available ] && cat /tmp/updates_available
[ -f $HOME/bin/new_mail.sh ] && $HOME/bin/new_mail.sh
