#!/bin/bash

source .env

sudo sed -i "s/INSERT_FROM_ENV_FILE/${SLACK_API_URL}/g" ${HOMEDIR}/casper-launch/prometheus/config/alertmanager.yml

sudo bash ${HOMEDIR}/casper-launch/prometheus/start_casper_prometheus_grabber.sh
sudo bash ${HOMEDIR}/casper-launch/prometheus/start_prometheus.sh
sudo bash ${HOMEDIR}/casper-launch/prometheus/start_alertmanager.sh
sudo bash ${HOMEDIR}/casper-launch/prometheus/start_blackbox_exporter.sh
