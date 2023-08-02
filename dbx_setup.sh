#!/bin/bash
#########################################################################
# Title:         dBox Setup Script                                    #
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

# Clone the repo
git clone https://github.com/Dosk3n/dbox.git /srv/dbox/git/

# Set ownership and permissions for the current user
CURRENT_USER=$(logname)  # Get the username of the current user
chown -R $CURRENT_USER:$CURRENT_USER /srv/dbox  # Change ownership recursively
chmod -R 755 /srv/dbox  # Set permissions recursively

# Set execution on scripts
chmod +x /srv/dbox/git/dbx_install.sh