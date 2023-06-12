#! /usr/bin/bash

# Enable the NodeSource repository by running the
# following curl command as a user with sudo privileges :

nodeVersion="18"
curl -sL "https://deb.nodesource.com/setup_${nodeVersion}.x" | sudo -E bash -

# install both node and npm
sudo apt install nodejs
