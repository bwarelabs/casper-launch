#!/bin/bash

source .env

user_exists(){ id "${USERNAME}" &>/dev/null; } # silent, it just sets the exit code
if user_exists "${USERNAME}"; then  # use the function, save the code
    echo 'User already exists - no need to create another one'
else
    sudo useradd $USERNAME -s /bin/bash -m -g sudo
    sudo echo "$USERNAME ALL=(ALL:ALL) ALL" >> /etc/sudoers
    sudo passwd $USERNAME
fi
