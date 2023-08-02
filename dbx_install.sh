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

# Install required applications

sudo apt-get update

# Docker
# Remove old pkgs
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done




mkdir /mnt/local/dbox/

mkdir /mnt/local/dbox/Backups/

mkdir /mnt/local/dbox/downloads/
mkdir /mnt/local/dbox/downloads/completed/
mkdir /mnt/local/dbox/downloads/incoming/
mkdir /mnt/local/dbox/downloads/nzbs/
mkdir /mnt/local/dbox/downloads/torrents/
mkdir /mnt/local/dbox/downloads/watched/

mkdir /mnt/local/dbox/Media/
mkdir /mnt/local/dbox/Media/Anime/
mkdir /mnt/local/dbox/Media/Audiobooks/
mkdir /mnt/local/dbox/Media/Books/
mkdir /mnt/local/dbox/Media/Movies/
mkdir /mnt/local/dbox/Media/Movies-4K/
mkdir /mnt/local/dbox/Media/Music/
mkdir /mnt/local/dbox/Media/Podcasts/
mkdir /mnt/local/dbox/Media/TV/
mkdir /mnt/local/dbox/Media/TV-4K/
mkdir /mnt/local/dbox/Media/XXX/

mkdir /mnt/local/dbox/transcodes/
mkdir /mnt/local/dbox/transcodes/plex/
mkdir /mnt/local/dbox/transcodes/plex/Transcode