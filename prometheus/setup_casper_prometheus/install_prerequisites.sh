#!/bin/bash

sudo apt-get update -y
sudo apt-get install python3-pip -y
pip3 install requests prometheus_client twisted
