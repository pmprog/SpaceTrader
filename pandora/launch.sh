#!/bin/bash

pnd_id="monort-ptitseb"

# Check Mono PND installed
if [ ! -e /usr/share/applications/$pnd_id*.desktop ];then
	zenity --error --title "Mono Runtime" --text="This application requires the Mono Runtime.
	Please download it from the Repo"
	exit
fi

# Locate Mono PND
pnd_path=$(sed -n 's/.*X-Pandora-Object-Path *= *\([^ ]*.*\)/\1/p' < /usr/share/applications/$pnd_id*.desktop)
pnd_name=$(sed -n 's/.*X-Pandora-Object-Filename *= *\([^ ]*.*\)/\1/p' < /usr/share/applications/$pnd_id*.desktop)
path_to_pnd=$pnd_path/$pnd_name
 
# Mount Mono
/usr/pandora/scripts/pnd_run.sh -p $path_to_pnd -b monort -m
 
#  Check it mounted properly
if [ ! -e /mnt/utmp/monort/monort.sh ];then
	zenity --error --title "Mono Runtime" --text="Could not mount Mono Runtime"
	/usr/pandora/scripts/pnd_run.sh -p $path_to_pnd -u &
	exit
fi

# Launch App
. /mnt/utmp/monort/monort.sh /mnt/utmp/monort
mono SpaceTrader.exe

# Unmount Mono
/usr/pandora/scripts/pnd_run.sh -p $path_to_pnd -b monort -u &

