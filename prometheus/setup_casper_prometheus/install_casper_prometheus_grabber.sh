#!/usr/bin/bash

source setup_casper_prometheus/.env

git clone https://github.com/pixiemars/CasperPrometheusGrabber.git

sed -i "s/http:\/\/localhost:8888\/status/http:\/\/${METRICS_IP}:${METRICS_PORT}\/${METRICS_PATH}/g" CasperPrometheusGrabber/StatusNodePromGrab.py
sed -i "s/interval = 60/interval = ${SCRAPE_INTERVAL}/g" CasperPrometheusGrabber/StatusNodePromGrab.py
sed -i "s/default_port = 8123/default_port = ${DEFAULT_PORT}/g" CasperPrometheusGrabber/StatusNodePromGrab.py

if [ -d /usr/local/etc/casper-prometheus-exporter ]; then
    sudo rm -rf /usr/local/etc/casper-prometheus-exporter
fi
sudo mkdir /usr/local/etc/casper-prometheus-exporter
sudo cp -R CasperPrometheusGrabber/* /usr/local/etc/casper-prometheus-exporter/.
sudo rm -rf CasperPrometheusGrabber

sudo cat > /etc/systemd/system/casper-prometheus-exporter.service <<EOF
[Unit]
Description=Casper Prometheus Exporter Service

[Service]
ExecStart=/usr/bin/twistd3 -y /usr/local/etc/casper-prometheus-exporter/StatusNodePromGrab.py -d /usr/local/etc/casper-prometheus-exporter --nodaemon --pidfile=
WorkingDirectory=/usr/local/etc/casper-prometheus-exporter
User=local
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable casper-prometheus-exporter
sudo systemctl start casper-prometheus-exporter
