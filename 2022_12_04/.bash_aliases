#!/bin/bash
#	    _    _     ___    _    ____  _____ ____  
#	   / \  | |   |_ _|  / \  / ___|| ____/ ___| 
#	  / _ \ | |    | |  / _ \ \___ \|  _| \___ \ 
#	 / ___ \| |___ | | / ___ \ ___) | |___ ___) |
#	/_/   \_\_____|___/_/   \_\____/|_____|____/ 
#	                                             
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
	export PATH="/home/marslander/obsidian/scripts:$PATH"
fi

var=$(echo $PATH | grep -o "/.local/bin" | head -n 1)
if [ "$var" = "/.local/bin" ] ; then
	echo > /dev/null
else
	export PATH="/home/marslander/.local/bin:$PATH"
fi

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# }}}

# ALIASES 1
#{{{
	alias lsblk='sudo lsblk -f | less -S'
	alias fixtime='sudo ntpdate ntp.ubuntu.com'
	alias freespace="df -h | rg -i 'filesystem|^/dev'"
	alias run-picom="picom --experimental-backend -b"
	alias clear-clipboard="pkill greenclip && greenclip clear && greenclip daemon &"
	alias whoami="echo The Great Commandline Overlord"
	alias r=ranger
	alias e=exit
	alias cp='cp -i'
	alias mpv-aliases="mpv --input-test --force-window --idle"
	alias cdm='cd /run/media/marslander'
	alias clear-history='mv ~/.zhistory ~/.zhistory.old'
	alias delete-first-35-lines="sed -i '1,35d' ./*.txt; ranger"
	alias ssh='kitty +kitten ssh '
	alias g=gallery-dl
	alias gg='g -d . '
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
# FFMPEG
	#alias ffmpeg="ffmpeg -i $1 -vcodec libx264 -crf 27 -preset veryfast ./converted/$1"
# }}}

# OTHER
#{{{
	history-rg () { cat ~/.zhistory | rg "$1" }
# CREATE VIDEO DIR AND MOVE VIDEOS TO IT
	alias mvv="clear; mkdir videos;\ls *.mp4|xargs mv -t videos;exit"
# COUNT DOWNLOADED FILES
	watch_downloaded () { watch -n .5 'cat downloaded.txt|wc -l' }
# SSH INTO GALAXY S9
	alias ssh-galaxy-s9='ssh -p 8022 192.168.0.11'
# SFTP SEEDBOX
	sftp-seedbox () { cd /home/marslander/Downloads/
		sftp marsheat@lime.seedhost.eu:/home21/marsheat/downloads/torrents }
# ASSTR KRISTEN
kristen () { 
	# wait 2 seconds, retry 3 times
	lynx -nonumbers -dump -listonly "$1" | grep "txt$" | xargs wget -nc -T 2 -t 3 }
whichcat () { bat $(which "$1") }
ripme () { java -jar /home/marslander/1_internal_seagate/_AppImage/ripme* }
emailconverter () { java -jar /home/marslander/1_internal_seagate/_AppImage/emailconverter.jar "$1"}
unalias gp > /dev/null
gp () { 
	git add .
	git commit -m 'Manual Update'
	git push }
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
LFCD="/home/marslander/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lk=/home/marslander/.config/lf/lfub
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
# 'grep -B' includes lines before | '-A' is after
# '-o' means only output matched strings
extract_emails_from_xml () { 
    #grep -B 1 shouldTrash mailFilters.xml | grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' | sed -e 's/$/ OR /'
    grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' mailFilters.xml | sed -e 's/$/ OR /'
    #grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' mailFilters.xml 
}
#}}}

# APPIMAGE
#{{{
alias trezor='/run/media/marslander/4TB_Seagate/_AppImage/Trezor*'
alias grabber='/run/media/marslander/4TB_Seagate/_AppImage/Grabber*'
alias digikam='/run/media/marslander/4TB_Seagate/_AppImage/DigiKam*'
#}}}

##############################
# YOUTUBE-DL -- GALLERY-DL
#{{{
	yt () { youtube-dl -i --ignore-config "$1" }
	yt-downloaded () { watch -n .1 "printf 'Downloaded: '; cat downloaded.txt|wc -l; printf '\n'; cat downloaded.txt" }
# YOUTUBE TO MP3
	ytmp3 () { 
	    youtube-dl -i --console-title \
	    --ignore-config --download-archive downloaded.txt \
	    --extract-audio --force-ipv4 --audio-format mp3 "$@"
	}
# DOWNLOAD VIDEOS
	ytx () { youtube-dl -i \
		--ignore-config \
	    --no-post-overwrites \
	    --download-archive downloaded.txt \
		-a x }
	ytp () { youtube-dl -i --console-title \
	    --newline \
		--no-warnings \
		--ignore-config \
	    --download-archive downloaded.txt \
	    --no-post-overwrites \
	    --prefer-ffmpeg \
	    --merge-output-format mp4 \
	    --external-downloader aria2c \
	    --external-downloader-args "-c -j -x 10 -s 10 -k 1M" "$@" }
# SLIGHTLY FASTER THAN THE ONE ABOVE
	y () { youtube-dl -i --console-title \
	    --newline --no-warnings --ignore-config \
	    --download-archive downloaded.txt \
	    --no-post-overwrites \
	    --external-downloader aria2c \
	    --external-downloader-args "-c -j -x 20 -s 20 -k 10M" "$@" }
# BEST FORMAT FOR YOUTUBE
	yty () { youtube-dl -i --console-title \
	    --ignore-config \
	    --download-archive downloaded.txt \
	    --no-post-overwrites \
	    -f bestvideo+bestaudio \
	    -o "%(playlist)s/%(upload_date)s_%(title)s.%(ext)s"\
	    --no-mtime \
	    --prefer-ffmpeg \
	    --force-ipv4 \
	    --merge-output-format mp4 }
#}}}

##############################
# FZF
#{{{
fzf-vim () { rg -il "$1" | fzf --bind='enter:execute:nvim {}'; }
fzf-gedit () { rg -il "$1" | fzf --bind='enter:execute:gedit {}'; }
fzf-firefox () { rg -il "$1" | fzf --bind='enter:execute:firefox {}'; }
fzf-rm () { rg -il "$1" | fzf --bind='enter:execute:rm {+}';  }
fzf-find-vim () { find . -type f -iname "*$1*" | fzf --bind='enter:execute:nvim {+}'; }
fzf-find-rm () { find . -type f -iname "*$1*" exec rm {} \; }
#}}}

# FOUR DIGIT RENAME
#{{{
four-digit () {
    clear
    echo 'Processing request...'
    for f in *; do
        num=`expr match "$f" '[^0-9]*\([0-9]\+\).*'`
        padded=`printf "%04d" $num`
        newname=`echo $f | sed "s/${num}/${padded}/"`
        mv -n $f $newname
    done
    echo 'Added padding of zeroes to file names.\n'
}
#}}}

# FILTER ASSTR
#{{{
onlygirls () { 
    if [[ -d "../1_only_girls" ]]
    then
        clear
        ack -l '\(.*M+\+*[MFmfg]*\/*\+*[MFmfg]*[fg]+\-*(teen)*\+*[,)]' \
        | xargs mv -b -t ../1_only_girls/
    else
        mkdir ../1_only_girls
        ack -l '\(.*M+\+*[MFmfg]*\/*\+*[MFmfg]*[fg]+\-*(teen)*\+*[,)]' \
        | xargs mv -b -t ../1_only_girls/
    fi
}
onlygirls-rg () { 
    if [[ -d "../1_only_girls" ]]
    then
        clear
		rg -l '\(.*M+\+*[MFmfg]*/*\+*[MFmfg]*[fg]+\-*(teen)*\+*[,)]' \
        | xargs mv -b -t ../1_only_girls/
    else
        mkdir ../1_only_girls
		rg -l '\(.*M+\+*[MFmfg]*/*\+*[MFmfg]*[fg]+\-*(teen)*\+*[,)]' \
        | xargs mv -b -t ../1_only_girls/
    fi
}

girls () { 
    clear
    num=$(ack -l '\(*.*M+\+*[MFmfg]*\/*\+*[MFmfg]*[fg]+\-*(teen)*\+*[,)]*' \
    | wc -l)
    printf "${num} files found.\n"
}
#}}}

###########################################################
###########################################################

# FIND COMMANDS 

# FIND FILES AND LOOK FOR STRING $1
#{{{
	findf () { find . -type f 2>&1 | rg -i "$1" }
# FIND FILES, BUT HIDE PATH
	findf_nopath () { find . -type f -printf "%f\n" | rg -i "$1" }
# FIND DIRECTORIES WHERE FILENAMES INCLUDE STRING $1
	findf_parent_dirs () { find . -type f 2>&1 | rg "$1" | sed 's|/[^/]*$||' | sort -u }
	findf_parent_dirs_i () { find . -type f 2>&1 | rg -i "$1" | sed 's|/[^/]*$||' | sort -u }
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

# RSYNC BACKUP TO EASYSTORE
#{{{
rsdd () {
	reset
	SRC=/home/marslander/1_int/
	DST=/home/marslander/2_ext/
	rsync -avhW --dry-run \
		--delete-before \
		--stats \
		--exclude-from="$SRC"/.paths \
		"$SRC" "$DST"
}
rsrd () {
	reset
	SRC=/home/marslander/1_int/
	DST=/home/marslander/2_ext/
	LOGFILE=/home/marslander/.rsync.txt
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


