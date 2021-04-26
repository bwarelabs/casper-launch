#!/usr/bin/bash

sudo bash /home/local/casper-launch/prometheus/start_casper_prometheus_grabber.sh; wait
sudo bash /home/local/casper-launch/prometheus/start_prometheus.sh
sudo bash /home/local/casper-launch/prometheus/start_alertmanager.sh
sudo bash /home/local/casper-launch/prometheus/start_blackbox_exporter.sh
