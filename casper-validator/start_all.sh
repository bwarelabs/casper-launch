#!/bin/bash

source .env

sudo bash utils/configure_firewall.sh
sudo bash utils/create_user.sh
sudo -u ${USERNAME} bash utils/install_prerequisites.sh
sudo -u ${USERNAME} bash utils/generate_keys.sh
sudo -u ${USERNAME} bash utils/start_node.sh
