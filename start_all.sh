#!/bin/bash

source .env

sudo bash utils/create_user.sh
sudo -u local bash utils/install_prerequisites.sh
sudo -u local bash utils/generate_keys.sh
sudo -u local bash utils/start_node.sh

