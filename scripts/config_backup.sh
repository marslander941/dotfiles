#!/bin/bash
clear

# Variables
#{{{
DATE=$(date +%Y_%m_%d)
DATE_TIME=$(date +%Y-%m-%d_%I:%M%p)
SRC=/home/$USER
DST=/home/$USER/1_int/backup_1/$DATE
DEST=/home/$USER/1_int/backup_1
ARCHIVE="$DATE"_backup.tar
LOGFILE=/home/$USER/._config-backup-log.txt
#}}}

# If backup folder was created earlier today, then delete it
#{{{
if [[ -d "$DST" ]]; then    

	# Warning message
	# {{{
	echo "Do you really want to overwrite today's backup? "; sleep 1; echo
	read -p "Continue (y/N)? " -n 1 -r; echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	    echo 'Proceeding in 5 seconds...'
		sleep 5
	else
	        echo 'Exiting...'
			exit && echo 'Backup aborted!'
	fi
	# }}}
	
    printf "Previous backup $DATE dir already exists!\n"
    printf "Deleting and recreating it ...\n\n"
    rm -rf "$DST"
    mkdir -p "$DST"
        # Check for tar backup archive
        if test -f "$DEST"/"$ARCHIVE"; then
            printf "Previous archive already exists!\n"
            printf "Deleting "$ARCHIVE"...\n"
            rm "$DEST"/"$ARCHIVE"
        else
            printf "No previous archive found.\n"
        fi
else
    printf "No previous backup found ...\n"
	mkdir -p "$DST"
        if [[ -d "$DST" ]]; then
            printf "Created destination dir for the backup\n"
        else
            printf "Could not create destination dir!\n" sleep 10
        fi            
fi
#}}}

# Backup
#{{{
if [[ -d "$DST" ]]; then
# Backup folders
    cp -ar "$SRC"/.config/{nvim,gallery-dl,kitty,ranger,mpv,feh,sxiv,picom,xfce4} "$DST"
    cp -ar "$SRC"/.config/{i3,qutebrowser,polybar,dunst,lf,plex-mpv-shim} "$DST"
    cp -ar "$SRC"/obsidian "$DST"
# Backup files
    cp -a "$SRC"/.config/{youtube-dl.conf,greenclip.toml} "$DST"
    cp -a "$SRC"/{.bash_aliases,.bashrc,.zsh_history,.lftprc,.zshrc,.Xresources,.p10k.zsh,.xinitrc} "$DST"
# Bluetooth settings backup
	mkdir -p "$DST"/etc/bluetooth && \
		cp /etc/bluetooth/main.conf "$DST"/etc/bluetooth/main.conf
# Saving crontab file
    crontab -l > "$DST"/crontab.txt
# Completion message
	printf "*** Config backup complete ***\n"; sleep 1
# Creating tar archive
    printf  "\nArchiving the backup...\n"
    cd "$DEST" && tar -cvf "$ARCHIVE" "$DATE"
else
    printf "No backup dir! Unable to start config backup!\n"; sleep 3
    printf "$DATE_TIME No backup dir! Unable to start config backup!\n\n"
fi | tee -a $LOGFILE
# }}}

