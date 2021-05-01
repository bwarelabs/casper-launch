# Casper Launch - Deploy a Casper validator - The Bware way

## What do you first need to know

- This repository is **NOT** an official repository offered by CasperLabs or other parties associeted directly with them.
- The scripts were written by the **BwareLabs** team internally for easily deploying a validator node on either mainnet or testnet.
- We highly recommend that you first read the [Casper Official Documentation](https://docs.casperlabs.io/en/latest/node-operator/index.html) in order to understand what is happening behind the curtains.
- Great thanks to the **Casper community** for the [How-To-Casper](https://github.com/make-software/how-to-casperlabs) repository! This repository is offering a great summary of how to deploy a Casper validator and was the main source of inspiration for the scripts which we provide.

## What does this repository contain

This repository has 2 main parts:
- The [casper-validator](/casper-validator) directory - bash scripts for deploying the Casper validator & launch a bonding request on the network
- The [prometheus](/prometheus) directory - bash scripts for deploying a custom monitoring solution based on Prometheus, Alertmanager and Blackbox + the custom Prometheus Grabber for Casper which can be found [here](https://github.com/pixiemars/CasperPrometheusGrabber) (Kudos to @pixiemars!) + integration with Slack 