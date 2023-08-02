#!/bin/bash
#########################################################################
# Title:         dBox Stage 1 Install Script                            #
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

# Docker
# Remove old pkgs
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker

sudo usermod -aG docker $USER


mkdir /mnt/local/dbox/

mkdir /mnt/local/dbox/appdata

mkdir /mnt/local/dbox/backups/

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

# Set ownership and permissions for the current user
CURRENT_USER=$(logname)  # Get the username of the current user
chown -R $CURRENT_USER:$CURRENT_USER /mnt/local  # Change ownership recursively
chmod -R 755 /mnt/local  # Set permissions recursively