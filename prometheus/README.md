# [BwareLabs] Monitoring solution for Casper validator

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) IMPORTANT NOTICE
**The scripts were tested on Ubuntu 20.04 LTS machines which respect the hardware requirements imposed by CasperLabs as seen [here](https://docs.casperlabs.io/en/latest/node-operator/hardware.html).**

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of the main directory
- _.env_ - this contains important environment variables which are needed in order to properly deploy the monitoring solution
  - **USERNAME** - in order to deploy a Casper node, you should do it with a non-root and non-casper user; this user is the same that we created earlier when deploying the node
  - **HOMEDIR** - home directory of the **${USERNAME}** user
  - **SLACK_API_URL** - webhook URL for your Slack channel (this will be adapted in the future for other communication channels)
- _start_alertmanager.sh_ - installs Alertmanager and configures its service
- _start_blackbox_exporter.sh_ - installs Blackbox Exporter and configures its service
- _start_casper_prometheus_grabber.sh_ - installs Casper Prometheus Grabber and configures its service
- _start_prometheus.sh_ - installs Prometheus and configures its service
- _start_instrumentation.sh_ - starts all the aforementioned tools, spinning the monitoring solution up
- _config_ - directory which contains .yml/.yaml files for configuring the aforementioned tools
- _setup_ - directory which contains helper scripts for installing the aforementioned tools
- _setup_casper_prometheus_ - directory which contains helper scripts for installing the Casper Prometheus Grabber

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of config directory
- _alert-rules.yaml_ - rules for alerting (this will be triggered in case something wrong happens and will be sent to the Slack channel mentioned in _alertmanager.yml_)
- _alertmanager.yml_ - Alertmanager configuration which contains the slack_api_url and the receiver channels (**IMPORTANT: YOU SHOULD HAVE THE CHANNELS MENTIONED HERE ALREADY CREATED IN SLACK**)
- _blackbox.yml_ - Blackbox Exporter configuration (default settings should be enough - used for RPC calls)
- _prometheus.yml_ - Prometheus configuration (default settings should be enough if using standard Casper installation)

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of setup directory
- _install_alertmanager.sh_ - downloads & installs Alertmanager binaries
- _install_blackbox_exporter.sh_ - downloads & installs Blackbox Exporter binaries
- _install_prometheus.sh_ - downloads & installs Prometheus binaries
 
## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contents of setup_casper_prometheus directory
- _.env_ - this contains important environment variables which are needed in order to properly deploy the custom Casper Prometheus Grabber
  - **METRICS_IP** - IP where the metrics of your node are exposed (default, _localhost_)
  - **METRICS_PORT** - PORT where the metrics of your node are exposed (default, _8888_)
  - **METRICS_PATH** - PATH where the metrics of your node are exposed (default, _status_)
  - **SCRAPE_INTERVAL** - interval between metrics calls (value in seconds - default, _10_)
  - **DEFAULT_PORT** - PORT where the Casper Prometheus Grabber exposes information (default, _8123_)
- _install_casper_prometheus_grabber.sh_ - downloads the binaries and configures the service
- _install_prerequisites_ - installs prerequisites necessary for the build

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) How to deploy the monitoring solution
- Carefully complete _.env_ with the appropiate values, depending on your use case
- Carefully complete _setup_casper_prometheus/.env_ with the appropiate values, depending on your use case
- From the _prometheus_ directory, run the following command in your terminal:
```
sudo bash start_instrumentation.sh
```
- This can be run as root or any other user with sudo rights
- Check if everything has run correctly by accessing http://YOUR_NODE_PUBLIC_IP:9090/ - here you should be able to see the appropiate targets and alerting rules

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Contact

For official inquiries, you can contact us at <info@bwarelabs.com>.

For other details, feel free to contact us on **Discord** (_Mateip | bwarelabs.com#1629_, _Silviu | bwarelabs.com#8286_, _Tibi | bwarelabs.com#4803_).

## ![alt text](https://github.com/bwarelabs/casper-launch/blob/main/docs/BWARE-icon.png) Copyright

Copyright © 2021 [BwareLabs](https://bwarelabs.com/)
- [Telegram](https://t.me/BwareLabsAnnouncements)
- [Twitter](https://twitter.com/BwareLabs)
- [Linkedin](https://www.linkedin.com/company/bwarelabs)

![alt text](https://github.com/bwarelabs/indexer-deployment/blob/main/docs/BWARE_yellow_gradient.png)
