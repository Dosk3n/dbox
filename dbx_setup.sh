#!/bin/bash
#########################################################################
# Title:         dBox Install Script                                    #
# Author(s):     Dosk3n                                                 #
# URL:           https://github.com/dosk3n/dbox                         #
# --                                                                    #
#########################################################################
#                   GNU General Public License v3.0                     #
#########################################################################

# https://raw.githubusercontent.com/Dosk3n/dbox/main/dbx_init.sh
# curl -sL https://raw.githubusercontent.com/Dosk3n/dbox/main/dbx_init.sh | sudo -H bash && cd /srv/dbox/git

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run with sudo or as the root user."
  exit 1
fi

# Clone the repo
git clone https://github.com/Dosk3n/dbox.git /srv/dbox/git/