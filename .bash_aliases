#!/bin/bash
# ALIASES FILE

# SOURCE THIS FILE
# {{{
s () { 
	. ~/.bash_aliases
	xrdb ~/.Xresources
	clear
}
# }}}

# IMPORT EXPORT SCRIPTS
# {{{
var=$(echo $PATH | grep -o script | head -n 1)
if [ "$var" = "script" ] ; then
	echo > /dev/null
else
	export PATH="/home/$USER/obsidian/scripts:$PATH"
fi

var=$(echo $PATH | grep -o "/.local/bin" | head -n 1)
if [ "$var" = "/.local/bin" ] ; then
	echo > /dev/null
else
	export PATH="/home/$USER/.local/bin:$PATH"
fi
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# }}}

# ALIASES 1
#{{{
	alias fixtime='sudo ntpdate ntp.ubuntu.com'
	alias freespace="df -h | rg -i 'filesystem|^/dev'"
	alias run-picom="picom --experimental-backend -b"
	alias clear-clipboard="pkill greenclip && greenclip clear && greenclip daemon &"
	alias r=ranger
	alias e=exit
	alias cp='cp -i'
	alias mpv-aliases="mpv --input-test --force-window --idle"
	alias cdm='cd /run/media/$USER'
	alias ssh='kitty +kitten ssh '
# TRASH-CLI
	alias rm="trash-put"
	alias trp="trash-put"
	alias tre="trash-empty"
	alias trl="trash-list"
	alias trr="trash-restore"
# LIST FILES
		#STEP 1: Delete LS-OPTIONS alias from /usr/share/zsh/manjaro-zsh-config
	alias ls='\ls --color=auto --group-directories-first'
	alias lss='\ls --color=auto -1 --group-directories-first'
	alias lsa='\ls -a --color=auto --group-directories-first'
	alias ll='ls -lh --group-directories-first --color=auto'
#}}}

# ALIASES 2
#{{{
# OUTPUTS THE NAME OF THE CURRENT TERMINAL
	alias terminalname='ps -p $(ps -p $$ -o ppid=) o args='
# SHORTENS XCLIP, SENDS OUTPUT TO SYSTEM CLIPBOARD
	alias xc="xclip -sel clip"
# SEND OUTPUT TO PASTE BIN || REQUIRES PACKAGE 'NETCAT'
	alias nc="nc termbin.com 9999 | xc"
# WRITE SPEED TEST
	alias writespeed='dd if=/dev/zero of=benchfile bs=4k count=200000 && sync; rm benchfile'
# READ SPEED TEST
	alias readspeed='sudo hdparm -tT /dev/sda'
# CPU TEMPERATURE
	alias temp='vcgencmd measure_temp'
# RSYNC ALIASES AND FUNCTIONS
	alias rsyncdry="rsync -avhWn --no-compress --progress"
	alias rsyncrun="rsync -avhW --no-compress --progress"
# MAKE NVIM DEFAULT
	export VISUAL='nvim'
	export EDITOR='nvim'
# VIM
	alias vi='nvim'
	alias svi='nvim'
	alias edit='nvim'
whichcat () { bat $(which "$1") }
unalias gp > /dev/null
gp () { git add .; git commit -m 'Manual Update'; git push }
gitcommit () { git add . && git commit -m 'all' }
func () {sed  -n "/$1/,/}}/p" ~/.bash_aliases | grep -v "}}" | bat -l bash }
#}}}

# CONFIG FILES
#{{{
alias aliases='/usr/bin/nvim ~/.bash_aliases'
alias vimrc='/usr/bin/vim ~/.vimrc'
alias nvimrc='/usr/bin/nvim ~/.config/nvim/init.vim'
alias nvimi3='nvim ~/.config/i3/config'
alias nvimpolybar='nvim ~/.config/polybar/config.ini'
alias nvimxresources='nvim ~/.Xresources'
alias nvimytdl='nvim ~/.config/youtube-dl.conf'
alias nvimlf='nvim ~/.config/lf/lfrc'
alias nvimlftp='nvim ~/.lftprc'
alias nnvimzsh='nvim ~/.zshrc'
alias nvimpicom='nvim ~/.config/picom/picom.conf'
alias nvimgal='nvim ~/.config/gallery-dl/config.json'
alias nvimkitty='nvim ~/.config/kitty/kitty.conf'
#}}}

# LFCD
#{{{
LFCD="/home/$USER/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lk=/home/$USER/.config/lf/lfub
#}}}

# TMUX ALIASES
#{{{
alias tm='tmux attach || tmux -2 new > /dev/null'
alias tma='tmux attach-session -t'
alias tml='tmux list-sessions'
alias tmn='tmux -2 new -s'
#}}}

# EXTRACT EMAIL ADDRESSES FROM FILTERS.XML FILE
#{{{
extract_emails_from_xml () { 
    grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' mailFilters.xml | sed -e 's/$/ OR /'
}
#}}}

# FIND COMMANDS 

# FIND FILES AND LOOK FOR STRING $1
#{{{
	findf () { find . -type f 2>&1 | rg -i "$1" }
# FIND FILES, BUT HIDE PATH
	findf_nopath () { find . -type f -printf "%f\n" | rg -i "$1" }
# FIND DIRECTORIES WHERE FILENAMES INCLUDE STRING $1
	findf_parent_dirs () { find . -type f 2>&1 | rg -i "$1" | sed 's|/[^/]*$||' | sort -u }
# FIND FOLDERS WITH FILENAMES THAT INCLUDE STRING
	findd () { find . -type d 2>&1 | rg -i "$1" }
# FIND ALL FILES AND SORT BY MODIFIED DATE
	findf_sort_by_date () { find . -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head -n 50 | less }
#}}}

# FIND ALL FILES AND FOLDERS THAT INCLUDE STRING
#{{{
find_df () {
    printf "Folders:\n"
    find . -type d | ack -i "$1"
    printf "\nFiles:\n"
    find . -type f | ack -i "$1"
}
#}}}

# FIND TEXT FILES THAT INCLUDE STRING, AND MOVE THEM 
# TO A ../DIRECTORY OF THE SAME NAME
#{{{
findmove () { 
    if [[ -d ../$1 ]]
        then
            echo "Folder already exists."
            sleep 1
            echo "Searching for files..."
        else
            mkdir ../$1
			echo "created folder: $1"
			sleep 1
			echo "Searching for files..."
    fi
    rg -il "$1" | xargs mv -b -t ../$1/
}
#}}}

# RSYNC BACKUP
#{{{
rsdd () {
	reset
	SRC=/home/$USER/1_int/
	DST=/home/$USER/2_ext/
	rsync -avhW --dry-run \
		--delete-before \
		--stats \
		--exclude-from="$SRC"/.paths \
		"$SRC" "$DST"
}
rsrd () {
	reset
	SRC=/home/$USER/1_int/
	DST=/home/$USER/2_ext/
	LOGFILE=/home/$USER/.rsync.txt
	trash-put "$LOGFILE" 2>/dev/null
	rsync -avh \
		--delete-before \
		--stats \
		--no-compress \
		--progress \
		--exclude-from="$SRC"/.paths \
		--log-file="$LOGFILE" \
		"$SRC" "$DST"
}
#}}}


