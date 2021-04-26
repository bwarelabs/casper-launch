#!/bin/bash
sudo apt-get install -qq ufw expect

sudo ufw allow to any port 22
sudo ufw allow to any port 35000
sudo ufw allow to any port 7777
sudo ufw allow to any port 8888
sudo ufw allow to any port 9999

sudo expect -c 'set timeout -1;
spawn sudo ufw enable;
expect -re "(.*)";
send "y\r";
expect eof'
