#!/bin/bash
#########################################################################
# Title:         dBox Base Install Script                               #
# Author(s):     Dosk3n                                                 #
# URL:           https://github.com/dosk3n/dbox                         #
# --                                                                    #
#########################################################################
#                   GNU General Public License v3.0                     #
#########################################################################
#
# https://raw.githubusercontent.com/Dosk3n/dbox/main/dbx_setup.sh
# curl -sL https://raw.githubusercontent.com/Dosk3n/dbox/main/dbx_setup.sh | sudo -H bash && cd /srv/dbox/git

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run with sudo or as the root user."
  exit 1
fi

mkdir ~/dbox/

mkdir ~/dbox/Backups/

mkdir ~/dbox/downloads/
mkdir ~/dbox/downloads/completed/
mkdir ~/dbox/downloads/incoming/
mkdir ~/dbox/downloads/nzbs/
mkdir ~/dbox/downloads/torrents/
mkdir ~/dbox/downloads/watched/

mkdir ~/dbox/Media/
mkdir ~/dbox/Media/TV/
mkdir ~/dbox/Media/Movies/

mkdir ~/dbox/transcodes/
mkdir ~/dbox/transcodes/plex/
mkdir ~/dbox/transcodes/plex/Transcode